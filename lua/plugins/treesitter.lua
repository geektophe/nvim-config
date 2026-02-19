return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,        -- Important : pas de lazy loading !
    build = ":TSUpdate", -- Met à jour les parsers automatiquement
    config = function()
        -- Installation des parsers
        require("nvim-treesitter").install({
            "bash",
            "css",
            "dockerfile",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "terraform",
            "hcl",
            "toml",
            "typescript",
            "vim",
            "yaml",
        })

        -- Active le highlighting automatiquement pour certains filetypes
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "lua",
                "python",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "yaml",
                "terraform",
                "markdown",
                "bash",
                "vim",
            },
            callback = function()
                vim.treesitter.start()
            end,
        })

        -- (Optionnel) Active le folding treesitter
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo[0][0].foldmethod = "expr"
                vim.wo[0][0].foldenable = false -- Désactivé par défaut
            end,
        })
    end,
}
