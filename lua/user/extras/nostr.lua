local M = {
  "nodetec/nostr.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = { "npm install", "npm run build", ":UpdateRemotePlugins" },
}

function M.config()
  require("nostr").setup {}

  local wk = require "which-key"

  wk.add {
    {
      "<leader>nc",
      "<cmd>lua require('nostr').config()<cr>",
      desc = "Generate config",
    },
  }
end

return M
