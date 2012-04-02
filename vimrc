" My basic .vimrc file.
"
"

syntax on		" Enable syntax highlighting.
filetype on
filetype plugin on
filetype indent on

set textwidth=0		" Set defulat text width to 80 chars.
set fo=lbr		" fo specifies default formatting options.
	" t - auto-wrap text
	" c - auto-wrap comments
	" r - auto-insert the current comment leader
	" q - allow formatting of comments.
set linebreak

set expandtab	" Turns tabs into n spaces.
set number      " Show line numbers by default.
set ruler       " Show the cursor position by default.
"set cursorline  " Show the cursor line by default.

set noswapfile

" Set tab width to 4 spaces.
set tabstop=4           
set shiftwidth=4        
set softtabstop=4       

set hidden      " Allow vim to manage multiple buffers effectively.


" Useful tab completion.
set wildmenu
set wildmode=list:longest

set visualbell  " I never have my sound turned on, anyway...

" Source my MATLAB plugin files (by Fabrice).
source $HOME/.vim/compiler/mlint.vim	" Enable m-lint to run as :make
source $HOME/.vim/ftplugin/matlab.vim	" 
source $HOME/.vim/indent/matlab.vim	" Make vim automatically indent 
source $HOME/.vim/syntax/matlab.vim	" MATLAB syntax highlighting.

" Pressing \w will toggle line wrapping.
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

" Allow me to move along displayed lines instead of physical lines.
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
noremap <buffer> <silent> <Down> gj
noremap <buffer> <silent> <Up> gk
