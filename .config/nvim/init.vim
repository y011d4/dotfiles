lua <<EOF
-- https://blog.atusy.net/2022/12/16/impatient-nvim/
-- impatient.nvimのクローン先をruntimepathに追加し、`require`で読めるようにする
vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/site/pack/jetpack/src/github.com/lewis6991/impatient.nvim')
-- impatient.nvimが読み込める場合のみ最適化する
local ok, impatient = pcall(require, 'impatient')
if ok then
  impatient.enable_profile()
else
  -- vim.notify(tostring(ok), vim.log.levels.ERROR)
  vim.notify("cache is not loaded", vim.log.levels.ERROR)
end
EOF


lua require('plugins')
"lua require('coc')
lua require('keymap')

lua <<EOF
local options = {
    clipboard = "unnamedplus",
    --set clipboard=unnamedplus,autoselect "クリップボード
    mouse = "a", --マウスを全モードで有効化

    expandtab = true, --タブ入力を複数の空白入力に置き換える
    tabstop = 4, --画面上でタブ文字が占める幅
    shiftwidth = 2, --自動インデントでずれる幅
    softtabstop = 2, --連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
    autoindent = true, --改行時に前の行のインデントを継続する
    smartindent = true, --改行時に入力された行の末尾に合わせて次の行のインデントを増減する
    number = true, --行番号を表示する
    title = true, --編集中のファイル名を表示
    showmatch = true, --?

    wrapscan = true, --検索時に最後まで行ったら最初に戻る

    swapfile = false, --swap file is not created
    autoread = true, --vim automatically reload when saved in other action
    list = true, --invisible character is displayed
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.cmd[[
syntax on "コードの色分け

au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.sage setlocal filetype=python.py

let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
let &t_ti.='\\e[1 q'
let &t_SI.='\\e[5 q'
let &t_EI.='\\e[1 q'
let &t_te.='\\e[0 q'
let g:previm_open_cmd = 'open -a Firefox'
set background=dark
set t_Co=256
set termguicolors
"colorscheme carbonfox
"let g:impact_transbg=1
"colorscheme cryptohack
"colorscheme iceberg
"colorscheme monokai
set cursorline
set cursorcolumn


"let g:python3_host_prog = '/home/y011d4/.virtualenvs/python3-env/bin/python'
"let g:python3_host_prog = '/home/y011d4/.local/bin/python'
let g:python3_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/home/y011d4/.virtualenvs/3.10.2/bin/python'
"let g:python3_host_prog = '/home/y011d4/.cache/pypoetry/virtualenvs/python3-env-tCB1VNE7-py3.10/bin/python'
"if exists("$VIRTUAL_ENV")
"    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
"else
"    let g:python3_host_prog = '/home/y011d4/.virtualenvs/python3-env/bin/python'
"    " QuickRun実行時対応
"    let $PATH = $HOME . '/home/y011d4/.virtualenvs/python3-env/bin/' . $PATH
"endif
let g:python_host_prog = '/home/y011d4/.virtualenvs/python2-env/bin/python'
]]

EOF




" set clipboard+=unnamedplus
" set mouse=a "マウスを全モードで有効化
"
" set expandtab "タブ入力を複数の空白入力に置き換える
" set tabstop=4 "画面上でタブ文字が占める幅
" set shiftwidth=4 "自動インデントでずれる幅
" set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
" set autoindent "改行時に前の行のインデントを継続する
" set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"
" set number "行番号を表示する
" set title "編集中のファイル名を表示
" set showmatch "編集中のファイル名を表示
" syntax on "コードの色分け
"
" set wrapscan "検索時に最後まで行ったら最初に戻る
"
" "set clipboard=unnamedplus,autoselect "クリップボード
"
" set noswapfile "swap file is not created
" set autoread "vim automatically reload when saved in other action
" set list "invisible character is displayed


"""""""""""""""""""dein.vim"""""""""""""""""""
"let $CACHE = expand('~/.cache')
"if !isdirectory($CACHE)
"  call mkdir($CACHE, 'p')
"endif
"if &runtimepath !~# '/dein.vim'
"  let s:dein_dir = fnamemodify('dein.vim', ':p')
"  if !isdirectory(s:dein_dir)
"    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
"    if !isdirectory(s:dein_dir)
"      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
"    endif
"  endif
"  execute 'set runtimepath^=' . substitute(
"        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
"endif
"
"" Ward off unexpected things that your distro might have made, as
"" well as sanely reset options when re-sourcing .vimrc
"set nocompatible
"
"" Set dein base path (required)
"let s:dein_base = '~/.cache/dein/'
"
"" Set dein source path (required)
"let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
"
"" Set dein runtime path (required)
"execute 'set runtimepath+=' . s:dein_src
"
"" Call dein initialization (required)
"call dein#begin(s:dein_base)
"
"call dein#add(s:dein_src)
"
"" Your plugins go here:
""call dein#add('Shougo/neosnippet.vim')
""call dein#add('Shougo/neosnippet-snippets')
"
"let s:toml_dir  = '~/.cache/dein/toml'
"let s:toml      = s:toml_dir . '/dein.toml'
"let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
"call dein#load_toml(s:toml,      {'lazy': 0})
"call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
"" Finish dein initialization (required)
"call dein#end()
"
"" Attempt to determine the type of a file based on its name and possibly its
"" contents. Use this to allow intelligent auto-indenting for each filetype,
"" and for plugins that are filetype specific.
"if has('filetype')
"  filetype indent plugin on
"endif
"
"" Enable syntax highlighting
"if has('syntax')
"  syntax on
"endif
"
"" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif


"""""""""""""""""""dein.vim"""""""""""""""""""
"if &compatible
"  set nocompatible
"endif
"
"set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
"
"if dein#load_state($HOME . '/.config/nvim/dein')
"    let g:dein#cache_directory = $HOME . '/.cache/dein'
"    call dein#begin($HOME . '/.config/nvim/dein')
"
"    let s:toml_dir  = $HOME . '/.config/nvim/dein/toml'
"    let s:toml      = s:toml_dir . '/dein.toml'
"    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
"
"    call dein#load_toml(s:toml,      {'lazy': 0})
"    call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
"    call dein#end()
"    call dein#save_state()
"endif
"
"filetype plugin indent on
"syntax enable
"
"if dein#check_install()
"    call dein#install()
"endif


" let mapleader = "\<Space>" "Leaderの変更
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
" noremap <Leader>r :QuickRun<CR>

" "added 11/25
" nnoremap <F9>   :exec "!szathura %:r.pdf" line('.')  col('.') "% > /dev/null"<cr><cr>
" function! Synctex()
"         " remove 'silent' for debugging
"         execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
" endfunction
" map <C-enter> :call Synctex()<cr>
"
"set clipboard&
"set clipboard^=unnamedplus

" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"
"
" "vim-fakeclip
" vmap ,y "*y
" nmap ,p "*p
"
" au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Firefox'
"
" set background=dark
" "colorscheme lucario
" set t_Co=256
" set termguicolors
" "let g:impact_transbg=1
" colorscheme carbonfox
" "colorscheme cryptohack
" "colorscheme iceberg
" "colorscheme monokai
"
" " Template
" "autocmd BufNewFile *.nim 0r $HOME/.vim/template/nim.txt
"
" set cursorline
" set cursorcolumn
"
"
" "let g:python3_host_prog = '/home/y011d4/.virtualenvs/python3-env/bin/python'
" "let g:python3_host_prog = '/home/y011d4/.local/bin/python'
" let g:python3_host_prog = '/usr/bin/python'
" "let g:python3_host_prog = '/home/y011d4/.virtualenvs/3.10.2/bin/python'
" "let g:python3_host_prog = '/home/y011d4/.cache/pypoetry/virtualenvs/python3-env-tCB1VNE7-py3.10/bin/python'
" "if exists("$VIRTUAL_ENV")
" "    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
" "else
" "    let g:python3_host_prog = '/home/y011d4/.virtualenvs/python3-env/bin/python'
" "    " QuickRun実行時対応
" "    let $PATH = $HOME . '/home/y011d4/.virtualenvs/python3-env/bin/' . $PATH
" "endif
" let g:python_host_prog = '/home/y011d4/.virtualenvs/python2-env/bin/python'
"
" "set spell
"
" au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"
" au BufNewFile,BufRead *.sage setlocal filetype=python.py
