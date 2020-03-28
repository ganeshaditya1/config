set number
set mouse=a
set hlsearch
set tabstop=4 shiftwidth=2 expandtab
set noswapfile
set wildmode=longest,list,full
set wildmenu
set laststatus=2

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


" tabline
set showtabline=2
highlight TabLine ctermfg=black ctermbg=gray cterm=bold
highlight TabLineSel ctermfg=white ctermbg=blue cterm=bold
highlight TabLineFill ctermfg=white ctermbg=white
highlight TabLineEmptySpace ctermfg=white ctermbg=white

set tabline=%!MyTabLine()

function MyTabLine()
  let s = '%#TabLineEmptySpace#  '
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
        let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= '%{MyTabLabel(' . (i + 1) . ')}%#TabLineEmptySpace#  '
  endfor
    

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T' 


  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineSel#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction



