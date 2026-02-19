return {
    "nvim-telescope/telescope.nvim",
    version = "*", -- Utilise toujours la dernière release stable
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Extension FZF native pour améliorer les performances
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                -- Parce que c'est joli
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                file_ignore_patterns = { ".git/", "node_modules" },

                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true, -- Affiche les fichiers cachés
                },
            },
        })

        -- Charge l'extension FZF
        telescope.load_extension("fzf")

        -- Keymaps
        local keymap = vim.keymap.set

        keymap("n", "<leader>ff", builtin.find_files,
            { desc = "Recherche de chaînes dans les noms de fichiers" })
        keymap("n", "<leader>fg", builtin.live_grep,
            { desc = "Recherche de chaînes dans le contenu des fichiers" })
        keymap("n", "<leader>fb", builtin.buffers,
            { desc = "Recherche dans les buffers" })
        keymap("n", "<leader>fh", builtin.help_tags,
            { desc = "Recherche dans l'aide" })
        keymap("n", "<leader>fw", builtin.grep_string,
            { desc = "Recherche du mot sous le curseur" })
        keymap("n", "<leader>fr", builtin.oldfiles,
            { desc = "Recherche dans les fichiers récents" })
    end,
}
