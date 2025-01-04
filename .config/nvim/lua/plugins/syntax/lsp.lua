return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local servers = { "lua_ls", "marksman" }

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end

		lspconfig.marksman.setup({
			cmd = { "marksman", "server" },
			filetypes = { "markdown" },
			settings = {
				marksman = {
					lint = true,
					completion = true,
					hover = true,
				},
			},
		})
	end,
}
