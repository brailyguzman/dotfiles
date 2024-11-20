return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out

	config = function()
		local conform = require("conform")

		require("conform").setup({
			formatters_by_ft = {
				markdown = { "prettier" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				prettier = {
					prepend_args = { "--single-quote", "--trailing-comma", "all", "--tab-width", "4" },
				},
			},
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
