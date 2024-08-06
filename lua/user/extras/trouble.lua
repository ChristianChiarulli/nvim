local M = {
  "folke/trouble.nvim",
}

function M.config()
  require("trouble").setup {}
  local wk = require "which-key"

  wk.add {
    {
      "<leader>lb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Diagnostics (buffer)",
    },
    {
      "<leader>ld",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics",
    },
    {
      "<leader>ls",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols",
    },
    {
      "<leader>lt",
      "<cmd>Trouble todo toggle<cr>",
      desc = "TODO",
    },
  }
end

return M
