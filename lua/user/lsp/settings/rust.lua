return {
  tools = {
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          vim.lsp.codelens.refresh()
        end,
      })
    end,
    inlay_hints = {
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
    },
    hover_actions = {
      auto_focus = false,
      border = "rounded",
      width = 60,
      -- height = 30,
    },
  },
  server = {
    --[[
        $ mkdir -p ~/.local/bin
        $ curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
        $ chmod +x ~/.local/bin/rust-analyzer
    --]]
    cmd = { os.getenv "HOME" .. "/.local/bin/rust-analyzer" },
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,

    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
