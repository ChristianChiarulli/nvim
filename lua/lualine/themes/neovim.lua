local colors = {
  blue   = '#7ccdfd',
  green  = '#87ffaf',
  purple = '#bb99f7',
  red    = '#d16969',
  orange = '#e1af69',
  fg     = '#c4c6cd',
  bg     = '#222428',
  gray  = '#2c2e33',
}

return {
	normal = {
		a = { fg = colors.bg, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.gray },
		c = { fg = colors.fg, bg = colors.bg },
	},
	insert = { a = { fg = colors.bg, bg = colors.green }, b = { fg = colors.green, bg = colors.gray } },
	visual = { a = { fg = colors.bg, bg = colors.purple }, b = { fg = colors.purple, bg = colors.gray } },
	command = { a = { fg = colors.bg, bg = colors.orange }, b = { fg = colors.orange, bg = colors.gray } },
	replace = { a = { fg = colors.bg, bg = colors.red }, b = { fg = colors.red, bg = colors.gray } },

	inactive = {
		a = { bg = colors.bg, fg = colors.blue },
		b = { bg = colors.bg, fg = colors.gray, gui = "bold" },
		c = { bg = colors.bg, fg = colors.gray },
	},
}

