return {
    {
        "windwp/nvim-autopairs",
        event = "insertenter",
        config = true,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "insertenter",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    -- Defaults
                    enable_close = true,           -- Auto close tags
                    enable_rename = true,          -- Auto rename pairs of tags
                    enable_close_on_slash = false, -- Auto close on trailing </
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = false,
                    },
                },
            })
        end,
    },
    {
        "bullets-vim/bullets.vim",
        config = function()
            vim.g.bullets_delete_last_bullet_if_empty = 1
        end,
    }
}
