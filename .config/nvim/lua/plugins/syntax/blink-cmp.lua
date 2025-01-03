return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"MeanderingProgrammer/render-markdown.nvim",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

		local opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "markdown" },
				providers = {
					markdown = {
						name = "RenderMarkdown",
						module = "render-markdown.integ.blink",
						fallbacks = { "lsp" },
					},
				},
				cmdline = {},
			},
			signature = { enabled = true },
		}

		require("blink.cmp").setup(opts)
	end,
}
