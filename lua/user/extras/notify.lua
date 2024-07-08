local M = {
  "rcarriga/nvim-notify",
}

function M.config()
  vim.notify = require "notify"
end

return M
