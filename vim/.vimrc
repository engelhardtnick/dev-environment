inoremap jk <ESC>
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set number
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab

setlocal tw=72
setlocal fo=cqt
setlocal wm=0
setlocal colorcolumn=+1

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%50v.*/
augroup END
