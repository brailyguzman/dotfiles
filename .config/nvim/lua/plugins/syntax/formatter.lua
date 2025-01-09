return {
    "stevearc/conform.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "zapling/mason-conform.nvim",
    },
    opts = {},
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                markdown = { "prettier" },
                lua = { "stylua" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },

            formatters = {
                prettier = {
                    prepend_args = { "--single-quote", "--trailing-comma", "all", "--tab-width", "4" },
                },
            },
        })

        require("mason-conform").setup({
            ignore_install = {},
        })

        vim.keymap.set({ "n", "v" }, "<leader>cf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
