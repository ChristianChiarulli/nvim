local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
	return
end

sniprun.setup {
  -- selected_interpreters = {}, --# use those instead of the default for the current filetype
  -- repl_enable = { "Python3_original" }, --# enable REPL-like behavior for the given interpreters
  -- repl_disable = {}, --# disable REPL-like behavior for the given interpreters

  -- interpreter_options = { --# intepreter-specific options, see docs / :SnipInfo <name>
  --   GFM_original = {
  --     use_on_filetypes = { "markdown.pandoc" }, --# the 'use_on_filetypes' configuration key is
  --     --# available for every interpreter
  --   },
  -- },

  --# you can combo different display modes as desired
  display = {
    -- "Classic", --# display results in the command-line  area
    "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
    -- "VirtualTextErr", --# display error results as virtual text
    -- "TempFloatingWindow",      --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    -- "NvimNotify",              --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },

  display_options = {
    terminal_width = 45, --# change the terminal display option width
    notification_timeout = 5, --# timeout for nvim_notify output
  },

  --# You can use the same keys to customize whether a sniprun producing
  --# no output should display nothing or '(no output)'
  show_no_output = {
    "Classic",
    "TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
  },

  --# customize highlight groups (setting this overrides colorscheme)
  snipruncolors = {
    SniprunVirtualTextOk = { bg = "NONE", fg = "#66eeff", ctermbg = "Black", cterfg = "Cyan" },
    SniprunFloatingWinOk = { fg = "NONE", ctermfg = "Cyan" },
    SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", cterfg = "Black" },
    SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
  },

  --# miscellaneous compatibility/adjustement settings
  inline_messages = 0, --# inline_message (0/1) is a one-line way to display messages
  --# to workaround sniprun not being able to display anything

  borders = "single", --# display borders around floating windows
  --# possible values are 'none', 'single', 'double', or 'shadow'
}
