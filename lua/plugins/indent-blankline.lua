return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			-- highlight = { "Function", "Label" },
			enabled = true,
			show_start = true,
			show_end = false,
			injected_languages = true,
			show_exact_scope = false,
		},

		exclude = {
			filetypes = {
				"help",
				"lazy",
				"neo-tree",
				"notify",
				"text",
				"startify",
				"dashboard",
				"neogitstatus",
				"NvimTree",
				"Trouble",
			},
			buftypes = { "terminal", "nofile" },
		},
	},
}
