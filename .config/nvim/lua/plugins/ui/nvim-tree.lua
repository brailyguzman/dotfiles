local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
    -- File explore
    -- nvim-tree.lua - A file explorer tree for neovim written in lua
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opt = true,
    },
    opts = {
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        log = {
            enable = true,
            truncate = true,
            types = {
                diagnostics = true,
            },
        },
        filters = {
            enable = true,
            git_ignored = true,
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = { "^.git$" },
            exclude = {},
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = false,
        },
        view = {
            float = {
                enable = true,
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w = screen_w * WIDTH_RATIO
                    local window_h = screen_h * HEIGHT_RATIO
                    local window_w_int = math.floor(window_w)
                    local window_h_int = math.floor(window_h)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                    return {
                        border = "rounded",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end,
        },

        git = {
            enable = false,
            ignore = true,
        },
        filesystem_watchers = {
            enable = true,
        },
        actions = {
            open_file = {
                resize_window = true,
            },
        },
        renderer = {
            root_folder_label = ":~:s?$?",
            highlight_git = false,
            highlight_opened_files = "none",

            indent_markers = {
                enable = true,
            },

            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },

                glyphs = {
                    default = "󰈚",
                    symlink = "",
                    folder = {
                        default = "",
                        empty = "",
                        empty_open = "",
                        open = "",
                        symlink = "",
                        symlink_open = "",
                        arrow_open = "",
                        arrow_closed = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)

        vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", {
            noremap = true,
            silent = true,
            desc = "Toggle NvimTree",
        })

        vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFocus<CR>", {
            noremap = true,
            silent = true,
            desc = "Focus NvimTree",
        })
    end,
}
