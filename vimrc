"support bidirectional language
set termbidi

"enable mouse
set mouse=a

" enable syntax highlighting
syntax enable
" syntax on what is differ

" show line numbers
" set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch

set encoding=UTF-8

" change cursor inser and norman mode
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"

let g:NERDTreeWinPos = "right"

" let g:airline_theme='papercolor'

" colorscheme PaperColor

" esc in insert mode
inoremap kj <esc>

set hlsearch " Highlight in search

" auto comment and uncooment with F6 and F7 key
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType vim   let b:comment_leader = '" '

call plug#begin()

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'rust-lang/rust.vim'

call plug#end()


syntax on
set t_Co=256
set cursorline
"colorscheme onehalflight
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" " let g:lightline = { 'colorscheme': 'onehalfdark' }

" relativ number in normal and abs in insert mode
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

filetype plugin indent on
