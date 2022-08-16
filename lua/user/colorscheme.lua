-- local colorscheme = "darkplus"
-- local colorscheme = "tender"
-- local colorscheme = "onedarker"
-- local colorscheme = "spacedark"
-- local colorscheme = "morning"
-- local colorscheme = "codemonkey"
-- local colorscheme = "gruvbox"
local colorscheme = "PaperColor"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
