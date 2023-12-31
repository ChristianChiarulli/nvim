local M = {
  "folke/neodev.nvim",
}

function M.config()
  require("neodev").setup {
    library = { plugins = { "neotest" }, types = true },
  }
end

return M
