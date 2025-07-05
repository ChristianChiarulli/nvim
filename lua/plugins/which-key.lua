return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		win = {
			border = "rounded",
			no_overlap = false,
			padding = { 0, 2 }, -- extra window padding [top/bottom, right/left]
			title = false,
			title_pos = "center",
			zindex = 1000,
		},
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Document existing key chains using new spec format
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>e", group = "explorer" },
			{ "<leader>f", group = "find" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>r", group = "rename/restart" },
			{ "<leader>D", desc = "Buffer diagnostics" },
			{ "<leader>d", desc = "Line diagnostics" },
			-- { "<leader>fg", group = "git" },
			-- { "<leader>n", group = "numbers" },
			-- { "<leader>s", group = "split" },
			-- { "<leader>t", group = "tab" },
		})
	end,
}
