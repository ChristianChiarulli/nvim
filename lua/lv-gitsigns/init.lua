local m = {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
}

m.config = function()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    return
  end
  gitsigns.setup(O.plugin.gitsigns)
end

return m
