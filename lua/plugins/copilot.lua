return {
	"zbirenbaum/copilot.lua",
	-- dependencies = { "copilotlsp-nvim/copilot-lsp" },
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				keymap = {
					-- jump_next = "<c-j>",
					-- jump_prev = "<c-k>",
					-- accept = "<tab>",
					refresh = "r",
					open = "<M-CR>",
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					-- accept = "<c-l>",
					accept = false,
					-- next = "<c-j>",
					-- prev = "<c-k>",
					dismiss = "<c-h>",
				},
			},
			-- nes = {
			-- 	enabled = true,
			-- 	keymap = {
			-- 		accept_and_goto = "<m-l>",
			-- 		accept = false,
			-- 		dismiss = "<Esc>",
			-- 	},
			-- },
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

		vim.keymap.set("i", "<tab>", function()
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
				return "<Ignore>"
			end
			return "<tab>"
		end, { expr = true, noremap = true })

		vim.g.copilot_nes_debounce = 100

		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "BlinkCmpMenuOpen",
		-- 	callback = function()
		-- 		vim.b.copilot_suggestion_hidden = false
		-- 	end,
		-- })
		--
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "BlinkCmpMenuClose",
		-- 	callback = function()
		-- 		vim.b.copilot_suggestion_hidden = false
		-- 	end,
		-- })

		-- require("copilot_cmp").setup()
	end,
}
