set number
set mouse=a
set hlsearch
set tabstop=4 shiftwidth=2 expandtab
set noswapfile
set wildmode=longest,list,full
set wildmenu

:command W w
:command Q q
:command Wq wq
:command WQ wq

syntax on

" File explorer configuration.
let g:netrw_liststyle = 3
let g:netrw_banner = 0
highlight CursorLine ctermbg=LightBlue cterm=NONE " As of for now, only netrw is using a CursorLine

" Keymappings
nnoremap <F2> :noh<CR>
