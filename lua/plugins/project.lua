return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",

	config = function()
		require("project_nvim").setup({
			active = true,
			on_config_done = nil,
			manual_mode = false,
			detection_methods = { "pattern" },
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn" },
			ignore_lsp = {},
			exclude_dirs = {},
			show_hidden = false,
			silent_chdir = true,
			scope_chdir = "global",
		})
	end,
}
