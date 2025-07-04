return {
	"nvimdev/indentmini.nvim",
	opts = {
		char = "│",
		minlevel = 1,
		only_current = false,
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
