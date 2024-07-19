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

  -- icon colors
  -- azure, blue, cyan, green, grey, orange, purple, red, yellow

  wk.add {
    {
      "<leader>a",
      group = "AI",
      icon = {
        icon = " ",
        color = "blue",
      },
    },
    {
      "<leader>q",
      "<cmd>confirm q<CR>",
      desc = "Quit",
    },
    {
      "<leader>h",
      "<cmd>nohlsearch<CR>",
      desc = "NOHL",
      hidden = true,
    },
    {
      "<leader>;",
      "<cmd>tabnew | terminal<CR>",
      desc = "Term",
      icon = {
        icon = " ",
        color = "green",
      },
    },
    {
      "<leader>w",
      "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>",
      desc = "Wrap",
      hidden = true,
    },
    {
      "<leader>v",
      "<cmd>vsplit<CR>",
      desc = "Split",
      hidden = true,
    },
    {
      "<leader>b",
      group = "Buffers",
    },
    {
      "<leader>d",
      group = "Debug",
    },
    {
      "<leader>f",
      group = "Find",
    },
    {
      "<leader>g",
      group = "Git",
    },
    {
      "<leader>l",
      group = "LSP",
      icon = {
        icon = " ",
        color = "blue",
      },
    },
    {
      "<leader>n",
      icon = {
        icon = "󱞂 ",
        color = "yellow",
      },
      group = "Nostr",
    },
    {
      "<leader>p",
      icon = {
        icon = " ",
        color = "azure",
      },
      group = "Plugins",
    },
    {
      "<leader>t",
      group = "Test",
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
      group = "Treesitter",
    },
  }
end

return M
