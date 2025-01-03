return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"zapling/mason-conform.nvim",
	},
	opts = {},
	config = function()
		require("conform").setup({
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
					prepend_args = {
						"--prose-wrap=always",
						"--end-of-line=lf",
						"--print-width=80",
					},
				},
			},
		})

		require("mason-conform").setup({
			ignore_install = {},
		})
	end,
}
