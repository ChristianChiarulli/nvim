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
    colorscheme = { "default" },
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

wk.add {
  {
    "<leader>pi",
    "<cmd>Lazy install<cr>",
    desc = "Install",
  },
  {
    "<leader>ps",
    "<cmd>Lazy sync<cr>",
    desc = "Sync",
  },
  {
    "<leader>pS",
    "<cmd>Lazy clear<cr>",
    desc = "Status",
  },
  {
    "<leader>pc",
    "<cmd>Lazy clean<cr>",
    desc = "Clean",
  },
  {
    "<leader>pu",
    "<cmd>Lazy update<cr>",
    desc = "Update",
  },
  {
    "<leader>pp",
    "<cmd>Lazy profile<cr>",
    desc = "Profile",
  },
  {
    "<leader>pl",
    "<cmd>Lazy log<cr>",
    desc = "Log",
  },
  {
    "<leader>pd",
    "<cmd>Lazy debug<cr>",
    desc = "Debug",
  },
}
