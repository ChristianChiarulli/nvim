local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = LAZY_PLUGIN_SPEC,
  install = {
    colorscheme = { "darkplus", "default" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

local wk = require "which-key"
wk.register {
  ["<leader>pi"] = { "<cmd>Lazy install<cr>", "Install" },
  ["<leader>ps"] = { "<cmd>Lazy sync<cr>", "Sync" },
  ["<leader>pS"] = { "<cmd>Lazy clear<cr>", "Status" },
  ["<leader>pc"] = { "<cmd>Lazy clean<cr>", "Clean" },
  ["<leader>pu"] = { "<cmd>Lazy update<cr>", "Update" },
  ["<leader>pp"] = { "<cmd>Lazy profile<cr>", "Profile" },
  ["<leader>pl"] = { "<cmd>Lazy log<cr>", "Log" },
  ["<leader>pd"] = { "<cmd>Lazy debug<cr>", "Debug" },
}
