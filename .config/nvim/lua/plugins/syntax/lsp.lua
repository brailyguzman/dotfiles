return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local servers =
			{ "lua_ls", "gopls", "ts_ls", "cssls", "html", "jsonls", "emmet_ls", "pyright", "bashls", "clangd" }

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			handlers = {
				emmet_ls = function()
					require("lspconfig").emmet_ls.setup({
						filetypes = {
							"css",
							"eruby",
							"html",
							"javascript",
							"javascriptreact",
							"less",
							"sass",
							"scss",
							"svelte",
							"pug",
							"typescriptreact",
							"vue",
							"liquid",
						},
					})
				end,
			},
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
