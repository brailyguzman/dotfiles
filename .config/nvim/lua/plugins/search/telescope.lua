return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-live-grep-args.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local extensions = require('telescope').extensions

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {
            noremap = true,
            silent = true,
            desc = "Find Files"
        })

        vim.keymap.set("n", "<leader>gf", builtin.git_files, {
            noremap = true,
            silent = true,
            desc = "Git Files"
        })

        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
            noremap = true,
            silent = true,
            desc = "Buffers"
        })

        vim.keymap.set("n", "<leader>fg", extensions.live_grep_args.live_grep_args, {
            noremap = true,
            silent = true,
            desc = "Project Grep"
        })

        require('telescope').setup({
            defaults = {
                path_display = { truncate = 1 },
                prompt_prefix = '   ',
                selection_caret = '  ',
                layout_config = {
                    prompt_position = 'top',
                },
                preview = {
                    timeout = 200,
                },
                sorting_strategy = 'ascending',
                file_ignore_patterns = { '.git/', 'node_modules/' },
            },
            extensions = {
                live_grep_args = {
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = {
                    previewer = false,
                    layout_config = {
                        width = 80,
                    },
                },
                oldfiles = {
                    prompt_title = 'History',
                },
                lsp_references = {
                    previewer = false,
                },
                lsp_definitions = {
                    previewer = false,
                },
                lsp_document_symbols = {
                    symbol_width = 55,
                },
            },
        })

        require('telescope').load_extension('fzf')
    end,
}
