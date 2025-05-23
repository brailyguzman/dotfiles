return {
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
			adaptive_size = false,
			side = "right",
			width = 35,
			signcolumn = "yes",
			preserve_window_proportions = true,
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
			root_folder_label = ":~:s?$?/..?",
			highlight_git = false,
			highlight_opened_files = "none",

			indent_markers = {
				enable = true,
			},

			icons = {
				show = {
					file = true,
					folder = false,
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
