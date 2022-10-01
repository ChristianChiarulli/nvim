local load = require "user.plugin.load"
local lazy = require "user.plugin.lazy"

-- Speed up loading.
load("impatient.nvim", {
  plugin_config = function()
    _G.__luacache_config = {
      chunks = {
        enable = true,
        path = vim.fn.stdpath "cache" .. "/luacache_chunks",
      },
      modpaths = {
        enable = true,
        path = vim.fn.stdpath "cache" .. "/luacache_modpaths",
      },
    }
    require "impatient"
  end,
})
load("filetype.nvim", {
  plugin_config = function()
    vim.g.did_load_filetypes = 1
  end,
})

load "plenary.nvim" -- Useful lua functions used ny lots of plugins
load "popup.nvim"
-- load "lua-dev.nvim"

-- LSP
load "nvim-lspconfig" -- enable LSP
-- load "nvim-lsp-installer" -- simple language server installer
load "mason.nvim"
load "mason-lspconfig.nvim"
load "null-ls.nvim" -- for formatters and linters
load "lsp_signature.nvim"
lazy("nvim-navic", {
  config = "navic",
})
lazy("symbols-outline.nvim", {
  plugin_config = "symbol-outline",
})
load "SchemaStore.nvim"
-- load "copilot.vim"
load "copilot.lua"
load("vim-illuminate", {
  plugin_config = "illuminate",
})
-- load("fidget.nvim", {
--   plugin_config = "fidget"
-- })
lazy("lsp-inlayhints.nvim", {
  plugin_config = "lsp-inlayhints",
})
-- load("inlay-hints.nvim")
lazy "lsp_lines.nvim"

-- Completion
load("nvim-cmp", {
  plugin_config = "cmp",
})
load "cmp-buffer" -- buffer completions
load "cmp-path" -- path completions
load "cmp-cmdline" -- cmdline completions
load "cmp_luasnip" -- snippet completions
load "cmp-nvim-lsp"
load "cmp-emoji"
load "cmp-nvim-lua"
load "copilot-cmp"
load "cmp-tabnine"

-- Snippet
lazy "LuaSnip" --snippet engine
lazy "friendly-snippets" -- a bunch of snippets to use

-- Syntax/Treesitter
load("nvim-treesitter", {
  plugin_config = "treesitter",
})
lazy("nvim-ts-context-commentstring", {
  plugin_config = "ts-context",
})
lazy "nvim-ts-rainbow"
lazy "playground"
lazy "nvim-ts-autotag"
lazy "nvim-treesitter-textobjects"
-- lazy "targets.vim"
-- lazy "nvim-treesitter-textsubjects"
lazy("nvim-surround", {
  plugin_config = "surround",
})
lazy("tabout.nvim", {
  plugin_config = "tabout",
})

-- Marks
lazy("harpoon", {
  plugin_config = "harpoon",
})
lazy("vim-bookmarks", {
  plugin_config = "bookmark",
})

-- Fuzzy Finder/Telescope
lazy("telescope.nvim", {
  plugin_config = "telescope",
})
lazy "telescope-media-files.nvim"
lazy "telescope-vim-bookmarks.nvim"

-- Note Taking
lazy "zk-nvim"

-- Color
lazy("nvim-colorizer.lua", {
  plugin_config = "colorizer",
})
-- lazy("color-picker.nvim")
lazy "colortils.nvim"

-- Colorschemes
load("darkplus.nvim", {
  plugin_config = function()
    require "user.colorscheme"
  end,
})
-- load "onedarker.nvim"
-- load "tokyonight.nvim"
-- load "colorschemes"

-- Utility
lazy("nvim-notify", {
  plugin_config = "notify",
})
lazy("dressing.nvim", {
  plugin_config = "dressing",
})
lazy("cybu.nvim", {
  plugin_config = "cybu",
})
lazy "vim-bbye"
lazy "impatient.nvim"
lazy("browse.nvim", {
  plugin_config = "browse",
})

-- Registers
lazy("registers.nvim", {
  plugin_config = "registers",
})

-- Icon
lazy("nvim-web-devicons", {
  plugin_config = "nvim-webdev-icons",
})

-- Debugging
lazy("nvim-dap", {
  plugin_config = "dap",
})
lazy "nvim-dap-ui"
-- lazy "nvim-dap-virtual-text"
-- lazy "DAPInstall.nvim"

-- Tabline
-- load "bufferline.nvim"
-- load "scope.nvim"

-- Statusline
load("lualine.nvim", {
  plugin_config = "lualine",
})

-- Startup
load("alpha-nvim", {
  plugin_config = "alpha",
})

-- Indent
load("indent-blankline.nvim", {
  plugin_config = "indentline",
})

-- File Explorer
lazy("nvim-tree.lua", {
  plugin_config = "nvim-tree",
  commands = {
    "NvimTreeToggle",
  },
})
lazy("lir.nvim", {
  plugin_config = "lir",
})

-- Comment
lazy("Comment.nvim", {
  plugin_config = "comment",
})
lazy("todo-comments.nvim", {
  plugin_config = "todo-comments",
})

-- Terminal
lazy("toggleterm.nvim", {
  plugin_config = "toggleterm",
})

-- Project
lazy("project.nvim", {
  plugin_config = "project",
})
lazy("nvim-spectre", {
  plugin_config = "spectre",
})

-- Session
lazy("auto-session", {
  plugin_config = "auto-session",
})
lazy "session-lens"

-- Quickfix
lazy "nvim-bqf"

-- Code Runner
lazy("jaq-nvim", {
  plugin_config = "jaq",
})
lazy("lab.nvim", {
  plugin_config = "lab",
})

-- Git
lazy("gitsigns.nvim", {
  config = "gitsigns",
})
lazy("git-blame.nvim", {
  plugin_config = "git-blame",
})
lazy("gitlinker.nvim", {
  plugin_config = "gitlinker",
})
lazy("vim-gist", {
  plugin_config = "gist",
})
lazy "webapi-vim"

-- Github
lazy "octo.nvim"

-- Editing Support
lazy("nvim-autopairs", {
  plugin_config = "autopairs",
})
lazy("dial.nvim", {
  plugin_config = "dial",
})
lazy("numb.nvim", {
  plugin_config = "numb",
})
lazy("vim-matchup", {
  plugin_config = "matchup",
})
lazy("zen-mode.nvim", {
  plugin_config = "zen-mode",
})
-- lazy("true-zen.nvim")
lazy("neoscroll.nvim", {
  plugin_config = "neoscroll",
})
lazy("vim-slash", {
  plugin_config = "vim-slash",
})

-- Motion
lazy("hop.nvim", {
  plugin_config = "hop",
})
-- lazy("eyeliner.nvim")

-- Keybinding
lazy("which-key.nvim", {
  plugin_config = "whichkey",
})

-- Java
lazy "nvim-jdtls"

-- Rust
lazy "rust-tools.nvim"
lazy("crates.nvim", {
  plugin_config = "crates",
})

-- Typescript
-- TODO: set this up, also add keybinds to ftplugin
lazy "typescript.nvim"

-- Markdown
lazy("markdown-preview.nvim", {
  pattern = "markdown",
})

-- Graveyard
-- lazy "nvim-treesitter-context"
-- lazy "iswap.nvim"
-- lazy "nvim-ts-rainbow"
-- lazy "telescope-ui-select.nvim"
-- lazy "telescope-file-browser.nvim"
-- lazy "cmp-npm" -- doesn't seem to work
-- lazy "JABS.nvim"
-- lazy "vim-solidity"
-- lazy "vim-repeat"
-- lazy "neovim-session-manager"
-- lazy "codi.vim"
-- lazy "NeoZoom.lua"
-- lazy "cmp-dap"
-- lazy "renamer.nvim"
-- lazy "conflict-marker.vim"
-- lazy "kanagawa.nvim"
-- lazy "quick-scope"
-- lazy "nlsp-settings.nvim" -- language server settings defined in json for
-- lazy "cutlass.nvim"
-- lazy "lsp-inlay-hints"
-- lazy "goto-preview"
-- lazy "aerial.nvim"
-- lazy "lsp_extensions.nvim"
-- lazy "nvim-gps"
-- lazy "stickybuf.nvim"
-- lazy "trouble.nvim"
-- lazy "tree-climber.nvim"
-- lazy "hop.nvim"
-- lazy("sniprun", {
--   plugin_config = "sniprun",
-- })
