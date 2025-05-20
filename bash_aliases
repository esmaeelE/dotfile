#!/bin/bash

###############################################################################
###############################################################################
###                                                                           #
###                     This is product                                       #
###                                                                           #
###############################################################################
###############################################################################

###############################################################################
#   Script Name         : .bash_aliases
#   Description         : customize bashrc
#                       : 
#
#                       
#                       
#   Creation Date       : 2024 02 04
#   Author              : esmaeelE
#
###############################################################################

###################################################################
# Some settings to use terminal, shell and workflow efficiently
# Latest edit: 2025_04_09
# GNU General Public License 
###################################################################


#### EDITOR ###
# tmux copy paste and fix bug
# editor: vim, emacs in terminal
alias em='emacs -nw'
export EDITOR='vim'

# RTL, for persian in terminal
alias   autodir='printf "\e[?2501h"'
autodir


###################################################################
# Functions
###################################################################

function route2remote() {
	sudo ip r add 111.11.11.0/24 via 192.168.5.3
}


clipv() {
  local input=""
  if [[ -p /dev/stdin ]]; then
    input="$(cat -)"
  else
    input="${@}"
  fi
    echo $input
    xclip -selection clipboard -i < $input
}

clipm() {
  local input=""
  if [[ -p /dev/stdin ]]; then
    input="$(cat -)"
  else
    input="${@}"
  fi
    echo $input
    xclip < $input
}

# Set Proxy
function onproxy() {
    export {http,https,ftp}_proxy="10.1.220.38:8080"
    export {HTTP,HTTPS,FTP}_PROXY="10.1.220.38:8080"
    # for socks5 for exmaple tor or ssh tunnel
    export {http,https,ftp}_proxy="socks5h://10.1.220.38:8080"
    export {HTTP,HTTPS,FTP}_PROXY="socks5h://10.1.220.38:8080"
    export no_proxy="127.0.0.1"
    export NO_PROXY="127.0.0.1"
#    export {HTTP,HTTPS,FTP}_PROXY="10.1.220.37:8080"
}

function onproxyi() {
    export {http,https,ftp}_proxy="172.30.116.9:6060"
    export {HTTP,HTTPS,FTP}_PROXY="172.30.116.9:6060"
    export no_proxy="127.0.0.1"
    export NO_PROXY="127.0.0.1"
#    export {HTTP,HTTPS,FTP}_PROXY="10.1.220.37:8080"
}

# Unset Proxy
function offproxy() {
    unset {http,https,ftp}_proxy
    unset {HTTP,HTTPS,FTP}_PROXY
}

function clip() {
    xclip -sel clip
}

function timer() {
	date1=`date +%s`; while true; do 
   		echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
	done
}

xstat() {
  for target in "${@}"; do
    inode=$(ls -di "${target}" | cut -d ' ' -f 1)
    fs=$(df "${target}"  | tail -1 | awk '{print $1}')
    crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | 
    grep -oP 'crtime.*--\s*\K.*')
    printf "%s\t%s\n" "${crtime}" "${target}"
  done
}

function digits() {
        local in; read in;
        printf "%'d\n" $in
}


function sum_col() {
        awk '{s+=$1} END {print s}' $1
}

function fwc() {
        gawk 'END {print NR}' $1 | digits
}


function list_cp() {
        # first list_of_files, second destination
        gxargs -a $1 gcp -t $2
}
##########################################################################################


##########################################################################################
### Pastebin ###
##########################################################################################
##########################################################################################

alias paste_bin='nc -N paste.ubuntu.ir 1337'

pastebin()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local file
        for file; do
            curl -s \
                --data-binary @"$file" \
                --header "X-FileName: ${file##*/}" \
                "$url"
        done
    else
        # curl -s --data-binary @- "$url" 
        curl --data-binary @- "$url" 
    fi
}

##########################################################################################
pasteget()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local arg
        for arg; do
            curl -s "${url}${arg##*/}"
        done
    else
        local arg
        while read -r arg; do
            curl -s "${url}${arg##*/}"
        done
    fi
}

##########################################################################################
##########################################################################################
##########################################################################################

##########################################################################################
# ls 
alias ls='ls --color=auto'
# fast ls
alias fls='/bin/ls -1U'
alias ll='ls -ltrh'
alias permission="stat --format='%n %a'" 
alias show_hidden="ls -d .[^.]*"

# proxy activation
# alias proxy_ned='ssh -D 0.0.0.0:9999 linux_manage -N'
# alias proxy_ned='ssh -D 0.0.0.0:9999 bsd -N'
alias proxy_tor='sudo systemctl restart tor'

# commnad
alias now="date '+%Y_%m_%d'"
alias now_j="jdate '+%Y_%m_%d'"
# alias now_t="date +'%A %Y/%m/%d %T ' ; now ; now_j"
alias now_t="date +'%A %T ' ; now ; now_j"
# some customize shortcut to do things

alias note='cd /home/esmaeel/dev/publish;vim tmp/.;'

# echo string with literal !@# enclouse inside '' not ""
# download with http connection provide from apache server is more faster than ssh, scp, rsync
alias dn='aria2c -c -s16 -x16 -j4'
# dn http://admin:password@1.1.1.1/nifi.tar.gz

PS1="$ "

alias tm="tmux new -s dev"
alias pb="nc -N paste.ubuntu-ir.org 1337"

alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'

# on "normal" linux
alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"

# write fucntion get time
#function time_n() {
#	curl 'http://worldtimeapi.org/api/timezone/America/New_York'; 
#}

alias get_time=' curl "http://worldtimeapi.org/api/timezone/America/New_York" | python3 -c "import sys, json; print (json.load(sys.stdin)["datetime"].split("T")[1].split(".")[0])" '

##########################################################################################
##########################################################################################
# poorman password manager, use middle click and three way of copy paste in GNU/Linux
##########################################################################################

address="/home/esmaeel/share/permissions/secret/vcen"

v_usr=$(sed '1q;d' ${address})
v_pass=$(sed '2q;d' ${address})

alias pass_us_vc="xclip -sel c <<< '${v_usr}'"
alias pass_vcen="xclip -sel c <<< '${v_pass}'"

alias pass_gene="xclip -sel c < /home/esmaeel/share/permissions/secret/gen"
alias pass_new="xclip -sel c < /home/esmaeel/share/permissions/secret/new"

##########################################################################################




