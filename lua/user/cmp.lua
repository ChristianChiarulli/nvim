local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-emoji",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
  },
  event = "InsertEnter",
}

function M.config()
  require("tailwindcss-colorizer-cmp").setup {
    color_square_width = 2,
  }

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

  local cmp = require "cmp"
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("typescriptreact", { "html" })

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local icons = require "user.icons"
  local types = require "cmp.types"

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(
        cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
        { "i", "c" }
      ),
      ["<C-j>"] = cmp.mapping(
        cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
        { "i", "c" }
      ),
      ["<C-p>"] = cmp.mapping(
        cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
        { "i", "c" }
      ),
      ["<C-n>"] = cmp.mapping(
        cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
        { "i", "c" }
      ),
      ["<C-h>"] = function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end,
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          -- fallback()
          require("neotab").tabout()
        else
          require("neotab").tabout()
          -- fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      expandable_indicator = true,
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
        })[entry.source.name]

        if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
          local duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          }

          local duplicates_default = 0

          vim_item.dup = duplicates[entry.source.name] or duplicates_default
        end

        if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
          local words = {}
          for word in string.gmatch(vim_item.word, "[^-]+") do
            table.insert(words, word)
          end

          local color_name, color_number
          if
            words[2] == "x"
            or words[2] == "y"
            or words[2] == "t"
            or words[2] == "b"
            or words[2] == "l"
            or words[2] == "r"
          then
            color_name = words[3]
            color_number = words[4]
          else
            color_name = words[2]
            color_number = words[3]
          end

          if color_name == "white" or color_name == "black" then
            local color
            if color_name == "white" then
              color = "ffffff"
            else
              color = "000000"
            end

            local hl_group = "lsp_documentColor_mf_" .. color
            -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
            vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
            vim_item.kind_hl_group = hl_group

            -- make the color square 2 chars wide
            vim_item.kind = string.rep("▣", 1)

            return vim_item
          elseif #words < 3 or #words > 4 then
            -- doesn't look like this is a tailwind css color
            return vim_item
          end

          if not color_name or not color_number then
            return vim_item
          end

          local color_index = tonumber(color_number)
          local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

          if not tailwindcss_colors[color_name] then
            return vim_item
          end

          if not tailwindcss_colors[color_name][color_index] then
            return vim_item
          end

          local color = tailwindcss_colors[color_name][color_index]

          local hl_group = "lsp_documentColor_mf_" .. color
          -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
          vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })

          vim_item.kind_hl_group = hl_group

          -- make the color square 2 chars wide
          vim_item.kind = string.rep("▣", 1)

          -- return vim_item
        end

        if entry.source.name == "copilot" then
          vim_item.kind = icons.git.Octoface
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        end

        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = icons.misc.Robot
          vim_item.kind_hl_group = "CmpItemKindTabnine"
        end

        if entry.source.name == "crates" then
          vim_item.kind = icons.misc.Package
          vim_item.kind_hl_group = "CmpItemKindCrate"
        end

        if entry.source.name == "lab.quick_data" then
          vim_item.kind = icons.misc.CircuitBoard
          vim_item.kind_hl_group = "CmpItemKindConstant"
        end

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        return vim_item
      end,
    },
    sources = {
      { name = "copilot" },
      {
        name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
          if kind == "Snippet" and ctx.prev_context.filetype == "java" then
            return false
          end

          if ctx.prev_context.filetype == "markdown" then
            return true
          end

          if kind == "Text" then
            return false
          end

          return true
        end,
      },
      { name = "luasnip" },
      { name = "cmp_tabnine" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
      { name = "calc" },
      { name = "emoji" },
      { name = "treesitter" },
      { name = "crates" },
      { name = "tmux" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    view = {
      entries = {
        name = "custom",
        selection_order = "top_down",
      },
      docs = {
        auto_open = false,
      },
    },
    window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
        col_offset = -3,
        side_padding = 1,
        scrollbar = false,
        scrolloff = 8,
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
      },
    },
    experimental = {
      ghost_text = false,
    },
  }

  pcall(function()
    -- local function on_confirm_done(...)
    --   require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
    -- end
    -- require("cmp").event:off("confirm_done", on_confirm_done)
    -- require("cmp").event:on("confirm_done", on_confirm_done)
  end)
end

return M
