alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'

alias   autodir='printf "\e[?2501h"'

# enable direction for rtl and ltr
autodir

# on "normal" linux
alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"
# cat file | copy
# <file copy
# copy < file
alias pas="copy</home/ee/work/passwd/pass.md"

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
