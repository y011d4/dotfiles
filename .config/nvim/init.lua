-- https://blog.atusy.net/2022/12/16/impatient-nvim/
-- impatient.nvimのクローン先をruntimepathに追加し、`require`で読めるようにする
-- vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/site/pack/jetpack/src/github.com/lewis6991/impatient.nvim')
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/impatient.nvim")
-- impatient.nvimが読み込める場合のみ最適化する
local ok, impatient = pcall(require, "impatient")
if ok then
	impatient.enable_profile()
else
	-- vim.notify(tostring(ok), vim.log.levels.ERROR)
	vim.notify("cache is not loaded", vim.log.levels.ERROR)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- vim.g["did_install_default_menus"] = 1
-- vim.g["did_install_syntax_menu"]   = 1
-- vim.g["did_indent_on"]             = 1
-- vim.g["did_load_filetypes"]        = 1
-- vim.g["did_load_ftplugin"]         = 0
-- vim.g["loaded_2html_plugin"]       = 1
-- vim.g["loaded_gzip"]               = 1
-- vim.g["loaded_man"]                = 1
-- vim.g["loaded_matchit"]            = 1
-- vim.g["loaded_matchparen"]         = 1
-- vim.g["loaded_netrwPlugin"]        = 1
-- vim.g["loaded_remote_plugins"]     = 1
-- vim.g["loaded_shada_plugin"]       = 1
-- vim.g["loaded_spellfile_plugin"]   = 1
-- vim.g["loaded_tarPlugin"]          = 1
-- vim.g["loaded_tutor_mode_plugin"]  = 1
-- vim.g["loaded_zipPlugin"]          = 1
-- vim.g["skip_loading_mswin"]        = 1

require("plugins")
-- require('coc')
require("keymap")

local options = {
	-- clipboard = "unnamedplus",  -- 起動が遅くなるので代わりに lazy に設定するようにしている
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
	wrap = true,

	swapfile = false, --swap file is not created
	autoread = true, --vim automatically reload when saved in other action
	list = true, --invisible character is displayed
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.clipboard = "unnamedplus" をすると起動が遅いので必要になったときに clipboard のロードをする設定をかく
-- https://www.reddit.com/r/neovim/comments/1293o2y/vimoptclipboard_unnamedplus_is_very_slow/
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		print(123345667)
		if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
			vim.g.clipboard = {
				copy = {
					["+"] = "win32yank.exe -i --crlf",
					["*"] = "win32yank.exe -i --crlf",
				},
				paste = {
					["+"] = "win32yank.exe -o --lf",
					["*"] = "win32yank.exe -o --lf",
				},
			}
		elseif vim.fn.has("unix") == 1 then
			if vim.fn.executable("xclip") == 1 then
				vim.g.clipboard = {
					copy = {
						["+"] = "xclip -selection clipboard",
						["*"] = "xclip -selection clipboard",
					},
					paste = {
						["+"] = "xclip -selection clipboard -o",
						["*"] = "xclip -selection clipboard -o",
					},
				}
			elseif vim.fn.executable("xsel") == 1 then
				vim.g.clipboard = {
					copy = {
						["+"] = "xsel --clipboard --input",
						["*"] = "xsel --clipboard --input",
					},
					paste = {
						["+"] = "xsel --clipboard --output",
						["*"] = "xsel --clipboard --output",
					},
				}
			end
		end

		vim.opt.clipboard = "unnamedplus"
	end,
	desc = "Lazy load clipboard",
})

vim.cmd([[
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
"let g:previm_open_cmd = 'open -a Firefox'
set background=dark
set t_Co=256
set termguicolors
set cursorline
set cursorcolumn

let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/home/y011d4/.virtualenvs/python2-env/bin/python'
]])
