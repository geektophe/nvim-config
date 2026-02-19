return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        -- Définir les formatters par type de fichier
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            markdown = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            terraform = { "terraform_fmt" },
            hcl = { "terraform_fmt" },
            sh = { "shfmt" },
            -- Formatter pour tous les fichiers (ex: trim whitespace)
            ["*"] = { "trim_whitespace" },
        },

        -- Options par défaut pour conform.format()
        default_format_opts = {
            lsp_format = "fallback",
        },

        -- Format automatiquement à la sauvegarde
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },

        -- Notifications
        notify_on_error = true,
        notify_no_formatters = true,

        -- Personnalisation des formatters (optionnel)
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" }, -- Indentation de 2 espaces
            },
        },
    },
}
