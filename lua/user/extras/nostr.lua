local M = {
  "nodetec/nostr.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = { ":UpdateRemotePlugins" },
}

function M.config()
  require("nostr").setup {}
end

return M
