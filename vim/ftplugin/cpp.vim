
" Shift-F runs clang format on the whole cpp file,
" or just the selected portion when in visual mode.
nnoremap <buffer>F :<C-u>ClangFormat<CR>
vnoremap <buffer>F :ClangFormat<CR>

