return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	config = function()
		local servers = { "lua_ls", "marksman" }

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local lspconfig = require("lspconfig")

		local capabilities = require("blink.cmp").get_lsp_capabilities()

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
