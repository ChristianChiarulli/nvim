local M = {
  "lukas-reineke/indent-blankline.nvim",
}

function M.config()
  local icons = require "user.icons"
  require("ibl").setup {
    indent = {
      char = icons.ui.LineLeft,
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      injected_languages = false,
      show_exact_scope = false,
      include = {
        node_type = { ["rust"] = { "let_declaration", "const_declaration" } },
      },
    },
    exclude = {
      filetypes = {
        "help",
        "lazy",
        "neo-tree",
        "notify",
        "text",
        "startify",
        "dashboard",
        "neogitstatus",
        "NvimTree",
        "Trouble",
      },
      buftypes = { "terminal", "nofile" },
    },
  }
end

return M
