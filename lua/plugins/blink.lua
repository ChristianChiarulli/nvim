return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "onsails/lspkind.nvim" },
		version = "1.*",
		config = function()
			-- setup() is also available as an alias
			require("lspkind").init({
				-- DEPRECATED (use mode instead): enables text annotations
				--
				-- default: true
				-- with_text = true,

				-- defines how annotations are shown
				-- default: symbol
				-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
				mode = "symbol_text",

				-- default symbol map
				-- can be either 'default' (requires nerd-fonts font) or
				-- 'codicons' for codicon preset (requires vscode-codicons font)
				--
				-- default: 'default'
				preset = "codicons",

				-- override preset symbols
				--
				-- default: {}
				symbol_map = {
					Array = " ",
					Boolean = " ",
					Class = " ",
					Color = " ",
					Constant = " ",
					Constructor = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Folder = "󰉋 ",
					Function = " ",
					Interface = " ",
					Key = " ",
					Keyword = " ",
					Method = " ",
					-- Module = " ",
					Module = " ",
					Namespace = " ",
					Null = "󰟢",
					Number = " ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					Reference = " ",
					Snippet = " ",
					String = " ",
					Struct = " ",
					Text = " ",
					TypeParameter = " ",
					Unit = " ",
					Value = " ",
					Variable = " ",
					Codeium = "󰚩 ",
				},
			})

			local opts = {
				cmdline = {
					keymap = {
						preset = "inherit",
						["<C-j>"] = { "select_next", "fallback" },
						["<C-k>"] = { "select_prev", "fallback" },
					},
				},

				keymap = {
					preset = "default",
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<CR>"] = { "select_and_accept", "fallback" },
				},
				-- menu = {
				-- 	draw = {
				-- 		columns = {
				-- 			{ "label", "label_description", gap = 1 },
				-- 			{ "kind_icon", "kind" },
				-- 		},
				-- 	},
				-- },

				fuzzy = {
					implementation = "lua",
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = {
					menu = {
						draw = {
							components = {
								kind_icon = {
									text = function(item)
										local kind = require("lspkind").symbol_map[item.kind] or ""
										return kind .. ""
									end,
									-- highlight = "CmpItemKind",
								},
								-- label = {
								-- 	text = function(item)
								-- 		return item.label
								-- 	end,
								-- 	highlight = "CmpItemAbbr",
								-- },
								-- kind = {
								-- 	text = function(item)
								-- 		return item.kind
								-- 	end,
								-- 	highlight = "CmpItemKind",
								-- },
							},
						},
					},

					documentation = { auto_show = false },
				},
				sources = {
					default = { "codeium", "lazydev", "lsp", "path", "buffer" },
					providers = {
						codeium = {
							name = "Codeium",
							module = "codeium.blink",
							async = true,
						},
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
			}
			require("blink.cmp").setup(opts)
		end,
	},
}
