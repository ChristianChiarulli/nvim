local M = {
  "folke/trouble.nvim",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>ld"] = { "<cmd>Trouble<cr>", "Diagnostics" },
    ["<leader>lt"] = { "<cmd>TodoTrouble<cr>", "TODO" },
  }
end

return M
