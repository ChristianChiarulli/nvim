local m = {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  event = "BufRead",
  disable = not O.plugin.zen.active,
}

m.config = function()
  local status_ok, zen_mode = pcall(require, "zen-mode")
  if not status_ok then
    return
  end

  zen_mode.setup(O.plugin.zen)
end

return m
