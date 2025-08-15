return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
	},
	config = function()
		local navic = require("nvim-navic")

		local function is_real_buffer()
			local ft = vim.bo.filetype
			return ft ~= "" and ft ~= "TelescopePrompt" and ft ~= "alpha" and ft ~= "neo-tree" and ft ~= "lazy"
		end

		local function lsp_servers()
			if not is_real_buffer() then
				return ""
			end
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return ""
			end
			local names = {}
			for _, client in ipairs(clients) do
				table.insert(names, client.name)
			end
			return "  " .. table.concat(names, ", ")
		end

		local function lsp_status()
			if not is_real_buffer() then
				return ""
			end
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return ""
			end

			local progress = vim.lsp.util.get_progress_messages()[1]
			if progress then
				return "⏳ " .. progress.title
			end
			return "✔️ LSP"
		end

		local function navic_location()
			if not is_real_buffer() then
				return ""
			end
			if navic.is_available() then
				local loc = navic.get_location()
				if loc ~= "" then
					return loc
				end
			end
			return ""
		end

		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
			separator = { left = "", right = "" },
			padding = { left = 1, right = 1 },
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "alpha", "dashboard", "TelescopePrompt", "lazy", "neo-tree" },
				},
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = {
					{ "branch", icon = "" },
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
					{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "󰡯",
							newfile = "",
						},
					},
					{ navic_location, color = { fg = "#A0A8CD" } },
				},
				lualine_x = {
					{ lsp_servers },
					{ lsp_status },
					"encoding",
					"fileformat",
					{ "filetype", icon_only = true, separator = "" },
				},
				lualine_y = {
					{ "progress", icon = "" },
				},
				lualine_z = {
					{ "location", icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

-- return { "echasnovski/mini.statusline", version = "*", opts = {} }
