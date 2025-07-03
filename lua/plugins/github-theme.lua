return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = {
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
			palettes = {
				github_dark_default = {
					-- Customize the cursor line background
					-- You can use any hex color here
					bg_highlight = "#1f2428", -- Darker background for cursor line
				},
			},
			groups = {
				github_dark_default = {
					-- Or override specific highlight groups
					CursorLine = { bg = "#1f2428" },
					-- You can also customize CursorLineNr if needed
					CursorLineNr = { fg = "#e1e4e8", bg = "#1f2428", bold = true },
				},
			},
		})
	end,
}
