-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 		lazy = true,
-- 		opt = true,
-- 	},
-- 	opts = {
-- 		diagnostics = {
-- 			enable = true,
-- 			show_on_dirs = true,
-- 			icons = {
-- 				hint = "",
-- 				info = "",
-- 				warning = "",
-- 				error = "",
-- 			},
-- 		},
-- 		log = {
-- 			enable = true,
-- 			truncate = true,
-- 			types = {
-- 				diagnostics = true,
-- 			},
-- 		},
-- 		filters = {
-- 			enable = true,
-- 			git_ignored = true,
-- 			dotfiles = false,
-- 			git_clean = false,
-- 			no_buffer = false,
-- 			custom = { "^.git$" },
-- 			exclude = {},
-- 		},
-- 		disable_netrw = true,
-- 		hijack_netrw = true,
-- 		hijack_cursor = true,
-- 		hijack_unnamed_buffer_when_opening = false,
-- 		sync_root_with_cwd = true,
-- 		update_focused_file = {
-- 			enable = true,
-- 			update_root = false,
-- 		},
-- 		view = {
-- 			adaptive_size = false,
-- 			side = "left",
-- 			width = 35,
-- 			signcolumn = "yes",
-- 			preserve_window_proportions = true,
-- 		},
-- 		git = {
-- 			enable = false,
-- 			ignore = true,
-- 		},
-- 		filesystem_watchers = {
-- 			enable = true,
-- 		},
-- 		actions = {
-- 			open_file = {
-- 				resize_window = true,
-- 			},
-- 		},
-- 		renderer = {
-- 			root_folder_label = ":~:s?$?/..?",
-- 			highlight_git = false,
-- 			highlight_opened_files = "none",
--
-- 			indent_markers = {
-- 				enable = true,
-- 			},
--
-- 			icons = {
-- 				show = {
-- 					file = true,
-- 					folder = false,
-- 					folder_arrow = true,
-- 					git = true,
-- 				},
--
-- 				glyphs = {
-- 					default = "󰈚",
-- 					symlink = "",
-- 					folder = {
-- 						default = "",
-- 						empty = "",
-- 						empty_open = "",
-- 						open = "",
-- 						symlink = "",
-- 						symlink_open = "",
-- 						arrow_open = "",
-- 						arrow_closed = "",
-- 					},
-- 					git = {
-- 						unstaged = "✗",
-- 						staged = "✓",
-- 						unmerged = "",
-- 						renamed = "➜",
-- 						untracked = "★",
-- 						deleted = "",
-- 						ignored = "◌",
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require("nvim-tree").setup(opts)
--
-- 		vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", {
-- 			noremap = true,
-- 			silent = true,
-- 			desc = "Toggle NvimTree",
-- 		})
--
-- 		vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFocus<CR>", {
-- 			noremap = true,
-- 			silent = true,
-- 			desc = "Focus NvimTree",
-- 		})
-- 	end,
-- }

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = true,
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
			debounce_delay = 50,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		filters = {
			dotfiles = false,
			git_ignored = false,
			custom = { "^.git$", "node_modules", "%.cache" },
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},
		view = {
			adaptive_size = true,
			side = "left",
			width = 35,
			preserve_window_proportions = true,
			signcolumn = "yes",
		},
		renderer = {
			highlight_git = true,
			highlight_opened_files = "all",
			root_folder_label = ":~:s?$?/..?",
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					item = "│ ",
					none = "  ",
				},
			},
			icons = {
				git_placement = "after",
				padding = " ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_closed = "",
						arrow_open = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
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
		filesystem_watchers = {
			enable = true,
			debounce_delay = 100,
			ignore_dirs = {},
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = true,
			},
			open_file = {
				quit_on_open = false,
				resize_window = true,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "terminal", "help" },
					},
				},
			},
		},
		log = {
			enable = false,
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)

		-- 📁 Key mappings
		vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
		vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
		vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse NvimTree" })
		vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
	end,
}
