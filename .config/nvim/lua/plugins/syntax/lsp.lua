return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local servers = { "lua_ls", "gopls", "ts_ls", "cssls", "html", "pyright", "bashls", "clangd" }
		local other = { "cspell", "prettier", "isort" }

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			other,
		})

		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
	end,
}
