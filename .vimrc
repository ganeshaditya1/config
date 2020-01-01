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

" Keymappings. Pipe character to separate command and comment.
nnoremap <F2> :noh<CR>| " clear search highlighting. Stop showing search results.
nnoremap <F5> :ls<CR>| " Show list of open buffers.
nnoremap <F6> :bn<CR>| " Next buffer
nnoremap <F7> :bp<CR>| " Previous buffer
nnoremap <F8> :bd<CR>| " Close buffer
