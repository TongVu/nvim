
-- =============================================== --
-- *********  MAKE BACKGROUND TRANSPARENT   ****** --
-- =============================================== --
vim.api.nvim_exec([[
" ==============================
" ======= TRANSPARENT   ========
" ==============================
hi Normal guibg=NONE ctermbg=NONE
let t:is_transparent = 1
function! Toggle_transparent_background()
if t:is_transparent == 1
hi Normal guibg=#282828 ctermbg=NONE
let t:is_transparent = 0
else
hi Normal guibg=NONE ctermbg=NONE
let t:is_transparent = 1
endif
endfunction
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

" ==============================
" ====   TRIM WHITE SPACE  =====
" ==============================
fun! TrimWhitespace()
let l:save = winsaveview()
keeppatterns %s/\s\+$//e
call winrestview(l:save)
endfun

augroup TRIM_SPACE
autocmd!
autocmd BufWritePre * :call TrimWhitespace()
augroup END

" ==============================
" === AUTO INDENT WHEN SAVE  ===
" ==============================
augroup autoindent
au!
autocmd BufWritePre * :normal migg=G`i
augroup End
]],
    true)
