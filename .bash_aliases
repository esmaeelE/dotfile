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

alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'

alias   autodir='printf "\e[?2501h"'
# enable direction for rtl and ltr
autodir

# on "normal" linux
alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"

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


alias paste_bin='nc -N paste.ubuntu.ir 1337'

# Set Proxy
function onproxy() {
    export {http,https,ftp}_proxy="127.0.0.1:8118"
    export {HTTP,HTTPS,FTP}_PROXY="127.0.0.1:8118"
#    export {HTTP,HTTPS,FTP}_PROXY="10.1.220.37:8080"
}

function onproxy_lantern() {
    export {http,https,ftp}_proxy="127.0.0.1:36623"
    export {HTTP,HTTPS,FTP}_PROXY="127.0.0.1:36623"
#    export {HTTP,HTTPS,FTP}_PROXY="10.1.220.37:8080"
}


# Unset Proxy
function offproxy() {
    unset {http,https,ftp}_proxy
    unset {HTTP,HTTPS,FTP}_PROXY
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

# ls 
alias ls='ls --color=auto'
# fast ls
alias fls='/bin/ls -1U'
alias permission="stat --format='%n %a'" 

# Set Proxy
function onproxy() {
    export {http,https,ftp}_proxy="10.1.220.38:8080"
    export {HTTP,HTTPS,FTP}_PROXY="10.1.220.38:8080"
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


