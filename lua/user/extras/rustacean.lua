-- https://github.com/mrcjkb/rustaceanvim/tree/master
local M = {
  "mrcjkb/rustaceanvim",
  version = "^4",
  lazy = false,
  ft = { "rust" },
}

function M.config()
  local lspconfig = require "user.lspconfig"
  vim.g.rustaceanvim = {
    tools = {},
    server = {
      on_attach = function(client, bufnr)
        lspconfig.on_attach(client, bufnr)
      end,

      capabilities = lspconfig.common_capabilities(),

      settings = {
        ["rust-analyzer"] = {
          inlayHints = {
            chainingHints = {
              bindingModeHints = {
                enable = true,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 25,
              },
              closureCaptureHints = {
                enable = true,
              },
              closureReturnTypeHints = {
                enable = "always", -- "never"
              },
              closureStyle = "impl_fn",
              discriminantHints = {
                enable = "always", -- "never"
              },
              expressionAdjustmentHints = {
                hideOutsideUnsafe = false,
                mode = "prefix",
              },
              implicitDrops = {
                enable = true,
              },
              lifetimeElisionHints = {
                enable = "always", -- "never"
                useParameterNames = true,
              },
              maxLength = 25,
              parameterHints = {
                enable = true,
              },
              rangeExclusiveHints = {
                enable = true,
              },
              renderColons = {
                enable = true,
              },
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
          lens = {
            enable = true,
          },
        },
      },
    },
    -- DAP configuration
    -- dap = {},
  }
end

return M
