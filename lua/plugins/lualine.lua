return {
	"nvim-lualine/lualine.nvim",
	commit = "a94fc68960665e54408fe37dcf573193c4ce82c9",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local custom_default = require("lualine.themes.default")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto", -- automatically detect colorscheme
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true, -- single statusline for all windows
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp" },
						sections = { "error", "warn", "info", "hint" },
						diagnostics_color = {
							error = "DiagnosticError",
							warn = "DiagnosticWarn",
							info = "DiagnosticInfo",
							hint = "DiagnosticHint",
						},
						symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
						colored = true,
						update_in_insert = false,
						always_visible = false,
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						newfile_status = false, -- display new file status (new file means no write after created)
						path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path, 3: Absolute path, with ~ as the home directory
						shorting_target = 40, -- Shortens path to leave 40 spaces in the window
						symbols = {
							modified = "[+]", -- Text to show when the file is modified
							readonly = "[-]", -- Text to show when the file is non-modifiable or readonly
							unnamed = "[No Name]", -- Text to show for unnamed buffers
							newfile = "[New]", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						-- color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			-- extensions = { "neo-tree", "lazy" },
		})
	end,
}
