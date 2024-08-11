local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local h = require "null-ls.helpers"
  local cmd_resolver = require "null-ls.helpers.command_resolver"
  local methods = require "null-ls.methods"
  local u = require "null-ls.utils"

  local FORMATTING = methods.internal.FORMATTING

  local biome = h.make_builtin {
    name = "biome",
    meta = {
      url = "https://biomejs.dev",
      description = "Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.",
      notes = {
        "Currently support only JavaScript, TypeScript and JSON. See status [here](https://biomejs.dev/internals/language-support/)",
      },
    },
    method = FORMATTING,
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    generator_opts = {
      command = "biome",
      args = {
        "lint",
        "--write",
        "--unsafe",
        "--stdin-file-path",
        "$FILENAME",
      },
      dynamic_command = cmd_resolver.from_node_modules(),
      cwd = h.cache.by_bufnr(function(params)
        return u.root_pattern("rome.json", "biome.json", "biome.jsonc")(params.bufname)
      end),
      to_stdin = true,
    },
    factory = h.formatter_factory,
  }

  local biome_check = h.make_builtin {
    name = "biome",
    meta = {
      url = "https://biomejs.dev",
      description = "Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.",
      notes = {
        "Currently support only JavaScript, TypeScript and JSON. See status [here](https://biomejs.dev/internals/language-support/)",
      },
    },
    method = FORMATTING,
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    generator_opts = {
      command = "biome",
      args = {
        "check",
        "--write",
        "--unsafe",
        "--stdin-file-path",
        "$FILENAME",
      },
      dynamic_command = cmd_resolver.from_node_modules(),
      cwd = h.cache.by_bufnr(function(params)
        return u.root_pattern("rome.json", "biome.json", "biome.jsonc")(params.bufname)
      end),
      to_stdin = true,
    },
    factory = h.formatter_factory,
  }

-- biome check --write

  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      formatting.shfmt,
      formatting.sql_formatter,
      -- biome,
      -- biome_check,

      -- diagnostics.shellcheck,

      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
