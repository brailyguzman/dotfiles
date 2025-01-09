return {
    "mfussenegger/nvim-lint",
    dependencies = {
        "williamboman/mason.nvim",
        "rshkarin/mason-nvim-lint",
    },
    config = function()
        require("lint").linters_by_ft = {
            javascript = { "eslint_d" },
            ["*"] = { "cspell" }
        }


        require("mason-nvim-lint").setup()

        vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                require("lint").try_lint("cspell")
            end,
        })
    end,
}
