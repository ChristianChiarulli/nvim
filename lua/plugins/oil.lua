return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = false,

			float = {
				max_height = 20,
				max_width = 60,
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}
