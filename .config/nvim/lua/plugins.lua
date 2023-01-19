vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- vim.cmd('packadd vim-jetpack')
-- vim.g["jetpack_copy_method"] = "copy"
require("lazy").setup({
  -- package manager
  -- { 'tani/vim-jetpack', opt = true }, -- bootstrap
  --'scrooloose/nerdtree',
  -- {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile', branch = 'main'},
  --[[
  {
      'neoclide/coc.nvim',
      branch = 'release',
      setup = function()
          vim.cmd('source ~/.config/coc/coc-setting.vim')
      end,
      --setup = function()
      --    vim.cmd('source ~/.config/coc/coc-setting.vim')
      --end,
  },
  --]]
  -- csv を列ごとに色をつけて表示
  'mechatroner/rainbow_csv',
  -- 構文解析に使う
  {
    'nvim-treesitter/nvim-treesitter',
    setup = function()
      require("treesitter-setting")
    end
  },
  -- 現在のカーソル位置の関数を1行目に表示してくれる
  'nvim-treesitter/nvim-treesitter-context',
  -- 関数や括弧のスコープを行の最後に表示
  'haringsrob/nvim_context_vt',
  -- 使うプラグインがいるので
  "kkharji/sqlite.lua",
  -- colorscheme
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    config = function()
      vim.cmd("colorscheme carbonfox")
    end
  },
  -- 他のプラグインで使われているのでいれてる
  {
    'nvim-lua/popup.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  -- icon の種類を豊富にする
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require('lualine-setting')
    end,
  },
  -- bufferline (?)
  --[[
  {
      'akinsho/bufferline.nvim', tag = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'
  },
  --]]
  -- 同じ使い方をしている場所をハイライトしてくれる
  --'RRethy/vim-illuminate',
  -- 色コードに色がつく
  'norcalli/nvim-colorizer.lua',
  -- カーソル下の単語全てに同じ色をつけてくれる
  {
    't9md/vim-quickhl',
    lazy = false,
    config = function()
      -- nmap <Space>m <Plug>(quickhl-manual-this)
      -- xmap <Space>m <Plug>(quickhl-manual-this)
      -- nmap <Space>M <Plug>(quickhl-manual-reset)
      -- xmap <Space>M <Plug>(quickhl-manual-reset)
      vim.keymap.set('n', '<Space>m', '<Plug>(quickhl-manual-this)')
      vim.keymap.set('x', '<Space>m', '<Plug>(quickhl-manual-this)')
      vim.keymap.set('n', '<Space>M', '<Plug>(quickhl-manual-reset)')
      vim.keymap.set('x', '<Space>M', '<Plug>(quickhl-manual-reset)')
    end
  },
  -- nvim 単体で起動したときのメニュー表示
  --[[
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    setup = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },
  --]]
  -- scrollbar 用のカラースキーム
  'folke/tokyonight.nvim',
  -- scrollbar を表示
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      'folke/tokyonight.nvim',
    },
    lazy = false,
    config = function()
      require("scrollbar").setup({})
      -- local colors = require("tokyonight.colors").setup()
      -- require("scrollbar").setup({
      --   handle = {
      --     color = colors.bg_highlight,
      --   },
      --   marks = {
      --     Search = { color = colors.orange },
      --     Error = { color = colors.error },
      --     Warn = { color = colors.warning },
      --     Info = { color = colors.info },
      --     Hint = { color = colors.hint },
      --     Misc = { color = colors.purple },
      --   }
      -- })
    end,
  },
  -- 検索時に何個目のマッチか表示
  {
    'kevinhwang91/nvim-hlslens',
    dependencies = {
      "petertriho/nvim-scrollbar",
    },
    lazy = false,
    config = function()
      require('nvim-hlslens-setting')
    end
  },
  -- ジャンプしやすくする
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    lazy = false,
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      require('hop-setting')
    end
  },
  -- f でジャンプするとき、1発でジャンプできる場所をハイライト
  -- 'unblevable/quick-scope',
  -- f 移動をベターにする (?)
  -- 'ggandor/lightspeed.nvim',
  -- プラグインがの dependencies のためいれている
  'nvim-lua/plenary.nvim',
  -- file を探したり文字列検索したり
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    lazy = false,
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fr', builtin.resume, {})
    end,
  },
  -- yank 結果を保存して、 fuzzy で選べるように
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    },
    lazy = false,
    config = function()
      require('neoclip').setup()
      vim.keymap.set('n', '<leader>fy', ':Telescope neoclip a<cr>')
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    setup = function()
      require "telescope".load_extension("frecency")
    end,
    dependencies = { "kkharji/sqlite.lua" }
  },
  -- * の検索の動作をよくする
  {
    'haya14busa/vim-asterisk',
    lazy = false,
    config = function()
      vim.keymap.set('', '*', '<Plug>(asterisk-*)')
      vim.keymap.set('', '#', '<Plug>(asterisk-#)')
      vim.keymap.set('', 'g*', '<Plug>(asterisk-g*)')
      vim.keymap.set('', 'g#', '<Plug>(asterisk-g#)')
      vim.keymap.set('', 'z*', '<Plug>(asterisk-z*)')
      vim.keymap.set('', 'z#', '<Plug>(asterisk-z#)')
      vim.keymap.set('', 'gz*', '<Plug>(asterisk-gz*)')
      vim.keymap.set('', 'gz#', '<Plug>(asterisk-gz#)')
      vim.g['asterisk#keeppos'] = 1
    end
  },
  -- keybind のマニュアルを :Whichkey で表示。自分で書かないとだめ?
  {
    'folke/which-key.nvim',
    lazy = false,
    config = function()
      require('which-key').setup()
    end
  },
  -- コメントを gcc (1行), gbc (ブロック) でやってくれる
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup()
    end
  },
  -- コメントを tsx とかでも賢くやってくれる
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    run = ":TSUpdate",
    lazy = false,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true
        }
      }
    end,
  },
  -- プログラミング言語特有のマッチもこなす (if, elif, else など) % でとべる
  {
    'andymass/vim-matchup',
    lazy = false,
    config = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      { "folke/neodev.nvim", config = true },
      "y011d4/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
      -- vim.lsp.set_log_level("debug")
      -- LSP が立ち上がってからの設定は mason-lspconfig に書いている
    end
  },
  -- LSP サーバーを UI からインストールできる
  {
    -- 'williamboman/mason.nvim',
    'y011d4/mason.nvim',
    branch = "feature/add-pysen",
  },
  -- mason でいれた LSP サーバー経由で設定
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require("mason-lspconfig-setting")
    end,
    dependencies = {
      'y011d4/mason.nvim',
      'folke/neodev.nvim',
    }
  },
  -- cmp の補完でアイコンを表示
  'onsails/lspkind.nvim',
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'onsails/lspkind.nvim',
      "L3MON4D3/LuaSnip",
    },
    lazy = false,
    config = function()
      require("nvim-cmp-setting")
    end
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'ray-x/cmp-treesitter',
  -- LSP の error を quickfix (?) に表示
  {
    'folke/trouble.nvim',
    lazy = false,
    config = function()
      require("trouble").setup {}
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
        { silent = true, noremap = true }
      )
    end,
  },
  -- ↓のライブラリで必要なので
  'MunifTanjim/nui.nvim',
  -- 左側にファイル一覧を表示、そこからファイルを開いたりできる
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "2.48",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
    -- opt = true,
    -- keys = { "\\" },
    -- cmd = "Neotree",
    lazy = false,
    config = function()
      require("neo-tree-setting")
    end,
  },
  -- git add や git commit ができる
  {
    'TimUntersberger/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = false,
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
    end
  },
  -- :DiffviewOpen できれいに diff を表示
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  -- 'airblade/vim-gitgutter',
  -- linter や formatter のために使用
  {
    -- "jose-elias-alvarez/null-ls.nvim",
    "y011d4/null-ls.nvim",
    branch = "feature/add-pysen",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("null-ls-setting")
    end
  },
  -- git の diff 状態を左側に緑/赤で表示してくれる
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      "petertriho/nvim-scrollbar",
    },
    lazy = false,
    config = function()
      require("gitsigns").setup {}
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  -- quickfix (gr で表示される枠) をよくする。そこから <C-t> や <C-v> でファイルを開けるようになったり
  'kevinhwang91/nvim-bqf',
  -- snipet (lua 製)
  {
    "L3MON4D3/LuaSnip", tag = "v1.1.0",
    lazy = false,
    config = function()
      require("luasnip.loaders.from_lua").load()
    end
  },
  -- LuaSnip の補完
  'saadparwaiz1/cmp_luasnip',
  {
    's1n7ax/nvim-window-picker',
    tag = 'v1.5',
    lazy = false,
    config = function()
      require 'window-picker'.setup()
    end,
  },
  -- 関数一覧を表示したり、関数間のジャンプをしたり
  {
    'stevearc/aerial.nvim',
    lazy = false,
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end,
  },
  -- 右下に LSP の状態を表示
  {
    'j-hui/fidget.nvim',
    lazy = false,
    config = function()
      require "fidget".setup {}
    end
  },
  -- TODO を目立つように表示
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  -- 補完のときに引数のシグナチャを表示
  {
    'ray-x/lsp_signature.nvim',
    lazy = false,
    config = function()
      require "lsp_signature".setup {}
    end
  },
  -- notification を右上に表示
  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      vim.notify = require("notify")
    end
  },
  -- nvim 読み込み時の cache を作り、起動を高速化する
  {
    'lewis6991/impatient.nvim',
    lazy = false,
    config = function()
      -- init.vim で呼んでいる
      -- require('impatient').enable_profile()
    end
  },
  'dstein64/vim-startuptime',
  {
    'folke/neodev.nvim',
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      'y011d4/mason.nvim',
      'y011d4/null-ls.nvim',
    }
  },
})
