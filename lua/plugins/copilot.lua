return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				keymap = {
					jump_next = "<c-j>",
					jump_prev = "<c-k>",
					accept = "<tab>",
					refresh = "r",
					open = "<M-CR>",
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<tab>",
					next = "<c-j>",
					prev = "<c-k>",
					dismiss = "<c-h>",
				},
			},
			filetypes = {
				yaml = true,
				markdown = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node",
		})

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

		-- require("copilot_cmp").setup()
	end,
}
