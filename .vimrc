
"support bidirectional language
set termbidi

"enable mouse
set mouse=a
" work in mouse tmux 
set ttymouse=xterm2

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
" change cursor insert and normal mode
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"
let g:NERDTreeWinPos = "right"
" esc in insert mode
inoremap kj <esc>
set hlsearch " Highlight in search
syntax on
set t_Co=256
set cursorline
" relativ number in normal and abs in insert mode
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
filetype plugin indent on
set autoindent
set cindent
" kernel newbie expressions
"
filetype plugin indent on

syntax on
set title
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
""

colorscheme onehalfdark

" colorscheme gruvbox

set pastetoggle=<F2>

nmap <F5> <Esc>:w<CR>:!clear;python3 %<CR>

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" toggle terminal with ctrl t
" nnoremap <C-t> :below terminal<CR>
nnoremap <C-t> :bel term<CR>
tnoremap <C-t> <CR>exit<CR>


let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

