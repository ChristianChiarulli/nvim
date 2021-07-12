local m = {
  "terrortylor/nvim-comment",
  event = "BufRead",
}

m.config = function()
  local status_ok, nvim_comment = pcall(require, "nvim_comment")
  if not status_ok then
    return
  end
  nvim_comment.setup()
end

return m
