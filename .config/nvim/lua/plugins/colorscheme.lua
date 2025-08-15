-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		-- Default options:
-- 		require("kanagawa").setup({
-- 			compile = false, -- enable compiling the colorscheme
-- 			undercurl = true, -- enable undercurls
-- 			commentStyle = { italic = true },
-- 			functionStyle = {},
-- 			keywordStyle = { italic = false },
-- 			statementStyle = { bold = false },
-- 			typeStyle = {},
-- 			transparent = true, -- do not set background color
-- 			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 			terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 			colors = { -- add/modify theme and palette colors
-- 				palette = {},
-- 				theme = {
-- 					wave = {},
-- 					lotus = {},
-- 					dragon = {},
-- 					all = {
-- 						ui = {
-- 							float = {
-- 								-- bg = "none",
-- 							},
-- 							bg_gutter = "none",
-- 						},
-- 					},
-- 				},
-- 			},
-- 			overrides = function(colors) -- add/modify highlights
-- 				return {}
-- 			end,
-- 			theme = "wave", -- Load "wave" theme
-- 			background = { -- map the value of 'background' option to a theme
-- 				dark = "wave", -- try "dragon" !
-- 				light = "lotus",
-- 			},
-- 		})
--
-- 		-- setup must be called before loading
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- }

-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }

-- return {
-- 	"vague2k/vague.nvim",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other plugins
-- 	config = function()
-- 		-- NOTE: you do not need to call setup if you don't want to.
-- 		require("vague").setup({
-- 			-- optional configuration here
-- 		})
-- 		vim.cmd("colorscheme vague")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
