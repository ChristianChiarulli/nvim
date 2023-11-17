local M = {
  "dmmulroy/tsc.nvim",
}

function M.config()
  -- local options = {
  --   auto_open_qflist = true,
  --   auto_close_qflist = false,
  --   bin_path = utils.find_tsc_bin(),
  --   enable_progress_notifications = true,
  --   flags = {
  --     noEmit = true,
  --     project = function()
  --       return utils.find_nearest_tsconfig()
  --     end,
  --   },
  --   hide_progress_notifications_from_history = true,
  --   spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  -- }

  require("tsc").setup()
end

return M
