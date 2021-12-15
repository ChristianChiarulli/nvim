vim.cmd[[
command! -count -nargs=* ToggleTerm lua toggleterm_wrap(<q-args>, <count>)
]]
