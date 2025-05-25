return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"cpp",
				"python",
				"typescript",
				"javascript",
				"asm",
				"go",
			},
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
