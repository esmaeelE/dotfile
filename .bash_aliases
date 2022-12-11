
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
