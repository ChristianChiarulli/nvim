return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = { -- set to setup table
		user_default_options = {
			names = false, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
			names_opts = { -- options for mutating/filtering names.
				lowercase = true, -- name:lower(), highlight `blue` and `red`
				camelcase = true, -- name, highlight `Blue` and `Red`
				uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
				strip_digits = false, -- ignore names with digits,
				-- highlight `blue` and `red`, but not `blue3` and `red4`
			},
			-- Expects a table of color name to #RRGGBB value pairs.  # is optional
			-- Example: { cool = "#107dac", ["notcool"] = "ee9240" }
			-- Set to false to disable, for example when setting filetype options
			names_custom = false, -- Custom names to be highlighted: table|function|false
			RGB = true, -- #RGB hex codes
			RGBA = true, -- #RGBA hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS *features*:
			-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
			tailwind = true, -- Enable tailwind colors
			tailwind_opts = { -- Options for highlighting tailwind names
				update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
			},
		},
	},
}
