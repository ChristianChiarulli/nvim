local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    preset = "helix",
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = false,
      title_pos = "center",
      zindex = 1000,
    },
    -- ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local wk = require "which-key"

  wk.add {
    {
      "<leader>q",
      "<cmd>confirm q<CR>",
      desc = "Quit",
    },
    {
      "<leader>h",
      "<cmd>nohlsearch<CR>",
      desc = "NOHL",
    },
    {
      "<leader>;",
      "<cmd>tabnew | terminal<CR>",
      desc = "Term",
    },
    {
      "<leader>w",
      "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>",
      desc = "Wrap",
    },
    {
      "<leader>v",
      "<cmd>vsplit<CR>",
      desc = "Split",
    },
    {
      "<leader>b",
      name = "Buffers",
    },
    {
      "<leader>d",
      name = "Debug",
    },
    {
      "<leader>f",
      name = "Find",
    },
    {
      "<leader>g",
      name = "Git",
    },
    {
      "<leader>l",
      name = "LSP",
    },
    {
      "<leader>p",
      name = "Plugins",
    },
    {
      "<leader>t",
      name = "Test",
    },
    -- {
    --   "<leader>a",
    --   name = "Tab",
    --   children = {
    --     {
    --       "<leader>an",
    --       "<cmd>$tabnew<cr>",
    --       desc = "New Empty Tab",
    --     },
    --     {
    --       "<leader>aN",
    --       "<cmd>tabnew %<cr>",
    --       desc = "New Tab",
    --     },
    --     {
    --       "<leader>ao",
    --       "<cmd>tabonly<cr>",
    --       desc = "Only",
    --     },
    --     {
    --       "<leader>ah",
    --       "<cmd>-tabmove<cr>",
    --       desc = "Move Left",
    --     },
    --     {
    --       "<leader>al",
    --       "<cmd>+tabmove<cr>",
    --       desc = "Move Right",
    --     },
    --   },
    -- },
    {
      "<leader>T",
      name = "Treesitter",
    },
  }
end

return M
