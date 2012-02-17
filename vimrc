" My basic .vimrc file.
"
"

syntax on		" Enable syntax highlighting.

set nocompatible	" Use gVim's default settings.

set tw=80		" Set defulat text width to 80 chars.
set fo=tcqr		" fo specifies default formatting options.
	" t - auto-wrap text
	" c - auto-wrap comments
	" r - auto-insert the current comment leader
	" q - allow formatting fo comments.

set expandtab	" Turns tabs into n spaces.

" Source my MATLAB plugin files.
source $HOME/.vim/compiler/mlint.vim	" Enable m-lint to run as :make
source $HOME/.vim/ftplugin/matlab.vim	" 
source $HOME/.vim/indent/matlab.vim	" Make vim automatically indent 
source $HOME/.vim/syntax/matlab.vim	" MATLAB syntax highlighting.

