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
      injected_languages = true,
      show_exact_scope = false,
      include = {
        node_type = {
          ["typescript"] = {
            "unary_expression",
            "expression_statement",
            "return_statement",
            "open_tag",
            "key",
            "array",
            "object",
            "lexical_declaration",
            "switch_statement",
            "switch_case",
            "switch_body",
            "switch_default"
          },

          ["tsx"] = {
            "unary_expression",
            "jsx_expression",
            "jsx_self_closing_element",
            "expression_statement",
            "return_statement",
            "open_tag",
            "key",
            "array",
            "object",
            "lexical_declaration",
            "switch_statement",
            "switch_case",
            "switch_body",
            "switch_default"
          },
          ["rust"] = { "let_declaration", "const_declaration" },
        },
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
