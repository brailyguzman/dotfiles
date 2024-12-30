return {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
	config = function()
		require("gitsigns").setup()
		vim.cmd("Gitsigns toggle_current_line_blame")
	end,
}
