return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			fuzzy = {
				implementation = "lua",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "codeium", "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					codeium = { name = "Codeium", module = "codeium.blink", async = true },
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
