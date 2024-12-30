return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			javascript = { "eslint_d" },
			["*"] = { "cspell" },
		}

		require("mason-nvim-lint").setup()
	end,
}
