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
			-- custom = { "^.git$", "node_modules", "%.cache" },
			custom = { "^.git$", ".obsidian" },
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},
		view = {
			adaptive_size = false,
			side = "left",
			width = 35,
			preserve_window_proportions = true,
			signcolumn = "yes",
		},
		renderer = {
			highlight_git = true,
			highlight_opened_files = "all",
			-- root_folder_label = function(path)
			-- 	local home = vim.loop.os_homedir()
			-- 	local display_path = path
			--
			-- 	-- Replace home directory with ~
			-- 	if vim.startswith(path, home) then
			-- 		display_path = "~" .. path:sub(#home + 1)
			-- 	end
			--
			-- 	-- Split path into parts
			-- 	local parts = {}
			-- 	for part in string.gmatch(display_path, "[^/]+") do
			-- 		table.insert(parts, part)
			-- 	end
			--
			-- 	-- Get last 3 parts (or less)
			-- 	local count = #parts
			-- 	local last_parts = {}
			-- 	for i = math.max(count - 2, 1), count do
			-- 		table.insert(last_parts, parts[i])
			-- 	end
			--
			-- 	local short_path = table.concat(last_parts, "/")
			-- 	return string.format("╭─ %s", short_path)
			-- end,
			root_folder_label = function(path)
				local name = vim.fn.fnamemodify(path, ":t") -- just the folder name
				return string.format("╭─ %s", name)
			end,
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
