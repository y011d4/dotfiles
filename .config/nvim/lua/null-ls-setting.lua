local null_ls = require "null-ls"
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup {
    -- debug = true,
    sources = {
        null_ls.builtins.formatting.prettier.with {
            prefer_local = "node_modules/.bin",
        },
        null_ls.builtins.formatting.prettierd.with {
            filetypes = { "html", "yaml", "markdown" }
        },
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.formatting.pysen,
        null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.diagnostics.fish,
        -- null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.yamlfmt,

        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.shellcheck,

        null_ls.builtins.formatting.csharpier,

        null_ls.builtins.formatting.sqlfmt,
    },
}
