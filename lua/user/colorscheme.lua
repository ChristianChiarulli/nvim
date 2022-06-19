local colorscheme = "darkneo"
-- vim.g.enfocado_style = 'neon' --" Available: `nature` or `neon`

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
