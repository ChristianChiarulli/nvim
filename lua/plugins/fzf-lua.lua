return {
	"ibhagwan/fzf-lua",
    enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			-- "telescope",
			-- keymap = {
			-- 	fzf = {
			-- 		["ctrl-q"] = "select-all+accept",
			-- 	},
			-- },
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				preview = {
					border = "border",
					wrap = "nowrap",
					hidden = "nohidden",
					vertical = "down:45%",
					horizontal = "right:50%",
					layout = "flex",
					flip_columns = 120,
					title = true,
					scrollbar = "float",
					delay = 100,
				},
			},
			fzf_opts = {
				["--layout"] = "reverse",
				["--info"] = "inline",
				["--bind"] = "ctrl-j:down,ctrl-k:up",
			},
			-- Global actions - applies to all pickers
			-- actions = {
			-- 	files = {
			-- 		["default"] = fzf.actions.file_edit,
			-- 		["ctrl-s"] = fzf.actions.file_split,
			-- 		["ctrl-v"] = fzf.actions.file_vsplit,
			-- 		["ctrl-t"] = fzf.actions.file_tabedit,
			-- 		["ctrl-q"] = fzf.actions.file_sel_to_qf,
			-- 		["alt-q"] = fzf.actions.file_sel_to_ll,
			-- 	},
			-- },
			-- files = {
			-- 	prompt = "Files❯ ",
			-- 	multiprocess = true,
			-- 	git_icons = true,
			-- 	file_icons = true,
			-- 	color_icons = true,
			-- 	fd_opts = "--color=never --type f --hidden --follow --exclude .git",
			-- 	rg_opts = "--color=never --files --hidden --follow -g '!.git'",
			-- 	cwd_prompt = false,
			-- },
			-- grep = {
			-- 	prompt = "Rg❯ ",
			-- 	input_prompt = "Grep For❯ ",
			-- 	multiprocess = true,
			-- 	git_icons = true,
			-- 	file_icons = true,
			-- 	color_icons = true,
			-- 	rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
			-- },
		})

		-- -- Keybindings
		-- local keymap = vim.keymap.set
		--
		-- -- Helper function to get git root
		-- local function get_git_root()
		-- 	local dot_git_path = vim.fn.finddir(".git", ".;")
		-- 	if dot_git_path ~= "" then
		-- 		return vim.fn.fnamemodify(dot_git_path, ":h")
		-- 	end
		-- 	return nil
		-- end

		-- -- File search from git root or cwd
		-- keymap("n", "<leader>ff", function()
		-- 	fzf.files({ cwd = get_git_root() })
		-- end, { desc = "Find files" })
		--
		-- -- Live grep from git root or cwd
		-- keymap("n", "<leader>ft", function()
		-- 	fzf.live_grep({ cwd = get_git_root() })
		-- end, { desc = "Find text" })
		--
		-- keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
		-- keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help tags" })
		-- keymap("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "Resume last search" })
		--
		-- -- Grep word under cursor from git root
		-- keymap("n", "<leader>fw", function()
		-- 	fzf.grep_cword({ cwd = get_git_root() })
		-- end, { desc = "Grep word under cursor" })
		--
		-- -- Additional useful mappings
		-- keymap("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent files" })
		-- keymap("n", "<leader>fc", "<cmd>FzfLua commands<cr>", { desc = "Commands" })
		-- keymap("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Keymaps" })
		-- keymap("n", "<leader>fs", "<cmd>FzfLua git_status<cr>", { desc = "Git status" })
		-- keymap("n", "<leader>fgc", "<cmd>FzfLua git_commits<cr>", { desc = "Git commits" })
		-- keymap("n", "<leader>fgb", "<cmd>FzfLua git_branches<cr>", { desc = "Git branches" })
		--
		-- -- Diagnostics
		-- keymap("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document diagnostics" })
		-- keymap("n", "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace diagnostics" })
	end,
}
