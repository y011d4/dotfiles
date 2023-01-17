-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "tsserver", "pylsp" }
}
require('mason-lspconfig').setup_handlers({ function(server)
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local opt = {
        -- -- Function executed when the LSP server startup
        on_attach = function(client, bufnr)
            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer

            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
            --vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format{filter=function(client) return client.name ~= "tsserver" end}<CR>')
            vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = true } end, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            -- vim.keymap.set('n', 'gdv', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
            -- vim.keymap.set('n', 'gdt', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', bufopts)
            vim.keymap.set('n', 'gd', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
            if server == 'pylsp' then
                -- install pylsp plugins: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
                -- なぜか isort は null-ls のものが動かないので、 pylsp を使う
                --vim.cmd(":PylspInstall pyls-isort")
                --vim.cmd(":PylspInstall pyls-flake8 pylsp-mypy pyls-isort")
                client.server_capabilities.documentFormattingProvider = false
                --vim.cmd(":echo 'aaa'")
            elseif server == 'tsserver' then
                -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/274#discussioncomment-1515526
                -- https://github.com/neovim/nvim-lspconfig/issues/1891#issuecomment-1157964108
                client.server_capabilities.documentFormattingProvider = false
            end
            -- local opts = { noremap=true, silent=true }
            -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            -- vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        ),
        settings = {
            -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
            pylsp = {
                configurationSources = { "flake8" },
                plugins = {
                    pycodestyle = {
                        enabled = 0
                    },
                    mccabe = {
                        enabled = 0
                    },
                    pyflakes = {
                        enabled = 0
                    },
                    flake8 = {
                        enabled = 1
                    },
                    -- default で enabled = 1 っぽいけど
                    pylsp_mypy = {
                        enabled = 0
                    },
                    -- default で enabled = 1 っぽいけど (pylsp_isort の名前であってるかわからない)
                    pylsp_isort = {
                        enabled = 0
                    },
                    pylint = {
                        enabled = 0,
                    },
                    -- black = {
                    --     enabled = 0,
                    --     line_length = 150
                    -- },
                    autopep8 = {
                        enabled = 0,
                    },
                    yapf = {
                        enabled = 0,
                    },
                },
            }
        }
    }
    require('lspconfig')[server].setup(opt)
end })
