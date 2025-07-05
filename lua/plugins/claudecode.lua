return {
	"git@github.com:ChristianChiarulli/claudecode.nvim.git",
	config = true,
	branch = "terminal-optional",
	opts = {
		auto_open_terminal = false,
		terminal_cmd = "/Users/chris/.claude/local/claude",
	},
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		-- { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>ac", "<cmd>ClaudeCodeStart<cr>", desc = "Start Claude" },

		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },

		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },

		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			-- "<leader>as",
			"<S-s>",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
