return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local servers = { "lua_ls", "gopls", "ts_ls", "cssls", "html", "pyright", "bashls", "clangd" }

			require("mason").setup()
			-- require("mason-lspconfig").setup({
			-- 	automatic_enable = false,
			-- 	ensure_installed = servers,
			-- })

			-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})

				vim.lsp.config(server, capabilities)
			end

			local bufopts = { noremap = true }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

			-- vim.diagnostic.config({ virtual_text = true })

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
					},
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config

		config = function()
			require("blink.cmp").setup({

				-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
				-- 'super-tab' for mappings similar to vscode (tab to accept)
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- All presets have the following mappings:
				-- C-space: Open menu or open docs if already open
				-- C-n/C-p or Up/Down: Select next/previous item
				-- C-e: Hide menu
				-- C-k: Toggle signature help (if signature.enabled = true)
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				keymap = {
					preset = "enter",
					["<C-y>"] = { "select_and_accept" },
				},

				appearance = {
					-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
					-- Adjusts spacing to ensure icons are aligned
					nerd_font_variant = "mono",
				},

				-- (Default) Only show the documentation popup when manually triggered
				completion = {
					accept = {
						-- experimental auto-brackets support
						auto_brackets = {
							enabled = true,
						},
					},
					menu = {
						draw = {
							components = {
								kind_icon = {
									text = function(ctx)
										local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
										return kind_icon
									end,
									-- (optional) use highlights from mini.icons
									highlight = function(ctx)
										local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
										return hl
									end,
								},
								kind = {
									-- (optional) use highlights from mini.icons
									highlight = function(ctx)
										local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
										return hl
									end,
								},
							},
						},
					},
					list = { selection = { preselect = false, auto_insert = true } },
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 200,
					},
				},

				signature = { enabled = true },

				-- Default list of enabled providers defined so that you can extend it
				-- elsewhere in your config, without redefining it, due to `opts_extend`
				sources = {
					-- adding any nvim-cmp sources here will enable them
					-- with blink.compat
					default = { "lsp", "path", "snippets", "buffer" },
				},

				-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
				-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
				-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
				--
				-- See the fuzzy documentation for more information
				fuzzy = { implementation = "prefer_rust_with_warning" },

				cmdline = {
					enabled = false,
				},
			})
		end,
		opts_extend = { "sources.default" },
	},
	{
		"stevearc/conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"zapling/mason-conform.nvim",
		},
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
				},

				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})

			require("mason-conform").setup({
				ignore_install = {},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"rshkarin/mason-nvim-lint",
		},
		config = function()
			require("lint").linters_by_ft = {
				-- markdown = { "vale" },
				javascript = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					-- require("lint").try_lint("cspell")
				end,
			})
		end,
	},
}
