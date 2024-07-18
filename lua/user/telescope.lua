local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local wk = require "which-key"

  wk.add {
    {
      "<leader>bb",
      "<cmd>Telescope buffers previewer=false<cr>",
      desc = "Find",
    },
    {
      "<leader>fb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Checkout branch",
    },
    {
      "<leader>fc",
      "<cmd>Telescope colorscheme<cr>",
      desc = "Colorscheme",
    },
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
    {
      "<leader>fp",
      "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
      desc = "Projects",
    },
    {
      "<leader>ft",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find Text",
    },
    {
      "<leader>fs",
      "<cmd>Telescope grep_string<cr>",
      desc = "Find String",
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Help",
    },
    {
      "<leader>fH",
      "<cmd>Telescope highlights<cr>",
      desc = "Highlights",
    },
    {
      "<leader>fi",
      "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>",
      desc = "Media",
    },
    {
      "<leader>fl",
      "<cmd>Telescope resume<cr>",
      desc = "Last Search",
    },
    {
      "<leader>fM",
      "<cmd>Telescope man_pages<cr>",
      desc = "Man Pages",
    },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent File",
    },
    {
      "<leader>fR",
      "<cmd>Telescope registers<cr>",
      desc = "Registers",
    },
    {
      "<leader>fk",
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
    },
    {
      "<leader>fC",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
    },
    {
      "<leader>go",
      "<cmd>Telescope git_status<cr>",
      desc = "Open changed file",
    },
    {
      "<leader>gb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Checkout branch",
    },
    {
      "<leader>gc",
      "<cmd>Telescope git_commits<cr>",
      desc = "Checkout commit",
    },
    {
      "<leader>gC",
      "<cmd>Telescope git_bcommits<cr>",
      desc = "Checkout commit(for current file)",
    },
    {
      "<leader>ls",
      "<cmd>Telescope lsp_document_symbols<cr>",
      desc = "Document Symbols",
    },
    {
      "<leader>lS",
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      desc = "Workspace Symbols",
    },
    {
      "<leader>le",
      "<cmd>Telescope quickfix<cr>",
      desc = "Telescope Quickfix",
    },
  }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function(ctx)
      vim.api.nvim_buf_call(ctx.buf, function()
        vim.fn.matchadd("TelescopeParent", "\t\t.*$")
        vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
      end)
    end,
  })

  local icons = require "user.icons"
  local actions = require "telescope.actions"

  local function filenameFirst(_, path)
    local tail = vim.fs.basename(path)
    local parent = vim.fs.dirname(path)
    if parent == "." then
      return tail
    end
    return string.format("%s\t\t%s", tail, parent)
  end

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. "  ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        -- "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
        path_display = filenameFirst,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
