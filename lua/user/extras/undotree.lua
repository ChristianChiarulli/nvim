local M = {
  "mbbill/undotree",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>u"] = { vim.cmd.UndotreeToggle, "Undotree" },
  }


end

return M
