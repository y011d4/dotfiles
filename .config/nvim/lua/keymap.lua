local noremap = { noremap = true }
local remap = { noremap = false }
vim.g.mapleader = " " --Leaderの変更
vim.g.maplocalleader = '<' -- ?
vim.keymap.set("", "<Leader>w", "<cmd>up<cr>", noremap)
vim.keymap.set("", "<cr>", "o<esc>", noremap)
-- noremap <Leader>e :e ~/.config/nvim/init.vim<CR>
vim.keymap.set("", "<S-j>", "}", noremap)
vim.keymap.set("", "<S-k>", "{", noremap)
vim.keymap.set("n", "<S-j>", "}zz", remap)
vim.keymap.set("n", "<S-k>", "{zz", remap)
vim.keymap.set("", "<S-h>", "^", noremap)
vim.keymap.set("", "<S-l>", "$", noremap)
-- noremap <Leader>/ *
vim.keymap.set("", "<Leader>v", "<cmd>vs .<cr>", noremap)
vim.keymap.set("", "<Leader>q", "<cmd>q!<cr>", noremap)
vim.keymap.set("", "j", "gjzz", noremap)
vim.keymap.set("", "k", "gkzz", noremap)
vim.keymap.set("", "<C-d>", "<C-d>zz", noremap)
vim.keymap.set("", "<C-u>", "<C-u>zz", noremap)
vim.keymap.set("n", "gv", "gg<S-v>G", noremap)
vim.keymap.set("i", "<C-f>", "<Esc>", noremap)
vim.keymap.set("n", "<C-f>", "<Esc>", noremap)
vim.keymap.set("i", "<C-c>", "<Esc>", noremap)
vim.keymap.set("n", "<C-c>", "<Esc>", noremap)
vim.keymap.set("n", "<C-h>", "<C-w>h", noremap)
vim.keymap.set("n", "<C-l>", "<C-w>l", noremap)
vim.keymap.set("n", "<A-r>", "<C-w>r", noremap)
vim.keymap.set("n", "<Leader>s", "<cmd>setlocal spell! spelllang=en_us,cjk<cr>", noremap)
vim.keymap.set("n", "<Leader>t", "<cmd>tabnew<cr>", noremap)
vim.keymap.set("n", "<A-j>", "gT", noremap)
vim.keymap.set("n", "<A-;>", "gt", noremap)

--[[ nnoremap <F9>   :exec "!szathura %:r.pdf" line('.')  col('.') "% > /dev/null"<cr><cr>
function! Synctex()
        " remove 'silent' for debugging
        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr> ]]

-- nmap j gjzz
-- nmap k gkzz
-- nmap <C-d> <C-d>zz
-- nmap <C-u> <C-u>zz
-- nmap <C-h> <C-w>h
-- nmap <C-l> <C-w>l
-- nnoremap <C-j> <C-w>j
-- nnoremap <C-k> <C-w>k
-- nnoremap <C-w>+ 10<C-w>+
-- nnoremap <C-w>- 5<C-w>+
-- noremap <Leader>r :QuickRun<CR>
--[[
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
]]

--[[ "vim-fakeclip
vmap ,y "*y
nmap ,p "*p ]]


--[[ " let mapleader = "\<Space>" "Leaderの変更
" let maplocalleader = '<'
" noremap <Leader>w :up<CR>
" noremap <CR> o<ESC>
"noremap <Leader>e :e ~/.config/nvim/init.vim<CR>
" noremap <S-j> }
" noremap <S-k> {
" "nmap <S-j> }zz
" "nmap <S-k> {zz
" noremap <S-h> ^
" noremap <S-l> $
" noremap <Leader>/ *
" noremap <Leader>v :vs .<CR>
"noremap <Leader>v :Denite file_rec<CR>
" noremap <Leader>q :q!<CR>
" "set cursorline
" noremap j gjzz
" noremap k gkzz
" noremap <C-d> <C-d>zz
" noremap <C-u> <C-u>zz
" nmap j gjzz
" nmap k gkzz
" nmap <C-d> <C-d>zz
" nmap <C-u> <C-u>zz
" noremap <Leader>m %
" nnoremap gv gg<S-v>G
" inoremap <C-f> <Esc>
" nnoremap <C-f> <Esc>
" inoremap <C-c> <Esc>
" nnoremap <C-c> <Esc>
" nnoremap <C-h> <C-w>h
" nmap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nmap <C-l> <C-w>l
" nnoremap <A-r> <C-w>r
" "nnoremap <C-j> <C-w>j
" "nnoremap <C-k> <C-w>k
" nnoremap <C-w>+ 10<C-w>+
" nnoremap <C-w>- 5<C-w>+
" "nnoremap <Leader>s :!setxkbmap -layout jp<CR><CR>
" nnoremap <Leader>s :setlocal spell! spelllang=en_us,cjk<CR>
" nnoremap <Leader>t :tabnew<CR>
" nnoremap <A-j> gT
" nnoremap <A-;> gt
" let g:C_Ctrl_j = 'off'
" let g:BASH_Ctrl_j = 'off'
" "nmap <C-j> gT
" "nnoremap <C-j> gT
" "nmap <C-k> gt
" noremap <Leader>r :QuickRun<CR> ]]
