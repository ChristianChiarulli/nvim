local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
  return
end

-- (Optional) easy way to get Neovim current size.
-- local ui = vim.api.nvim_list_uis()[1]

jabs.setup {
  position = "center", -- center, corner
  width = 50,
  height = 10,
  border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)

  -- Options for preview window
  preview_position = "top", -- top, bottom, left, right
  preview = {
    width = 70,
    height = 20,
    border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)
  },

  -- the options below are ignored when position = 'center'
  -- col = ui.width,  -- Window appears on the right
  -- row = ui.height/2, -- Window appears in the vertical middle
}
