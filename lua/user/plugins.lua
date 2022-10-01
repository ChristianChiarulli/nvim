local load = require("user.plugin.load")
-- local lazy = require("user.plugin.lazy")

-- Speed up loading.
load("impatient.nvim", {
  plugin_config = function()
    _G.__luacache_config = {
      chunks = {
        enable = true,
        path = vim.fn.stdpath("cache") .. "/luacache_chunks",
      },
      modpaths = {
        enable = true,
        path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
      },
    }
    require("impatient")
  end,
})
load("filetype.nvim", {
  plugin_config = function()
    vim.g.did_load_filetypes = 1
  end,
})

load("plenary.nvim") -- Useful lua functions used ny lots of plugins
load("popup.nvim")
load("lua-dev.nvim")
-- load("lua-dev.nvim")

-- LSP
load("nvim-lspconfigload") -- enable LSP
-- "nvim-lsp-installer" -- simple to use language server installer
load("mason.nvim")
load("wmason-lspconfig.nvim")
load("null-ls.nvim") -- for formatters and linters
load("lsp_signature.nvim")
load("nvim-navic")
load("symbols-outline.nvim")
load("SchemaStore.nvim")
-- load("copilot.vim")
load("copilot.lua")
load("vim-illuminate")
load("fidget.nvim")
load("lsp-inlayhints.nvim")
-- load("inlay-hints.nvim")
load("lsp_lines.nvim")

-- Completion
load("nvim-cmp")
load("cmp-buffer") -- buffer completions
load("cmp-path") -- path completions
load("cmp-cmdline") -- cmdline completions
load("cmp_luasnip") -- snippet completions
load("cmp-nvim-lsp")
load("cmp-emoji")
load("cmp-nvim-lua")
load("copilot-cmp")
load("cmp-tabnine")

-- Snippet
load("LuaSnip") --snippet engine
load("friendly-snippets") -- a bunch of snippets to use

-- Syntax/Treesitter
load("nvim-treesitter")
load("nvim-ts-context-commentstring")
load("nvim-ts-rainbow")
load("playground")
load("nvim-ts-autotag")
load("nvim-treesitter-textobjects")
-- load("targets.vim")
-- load("nvim-treesitter-textsubjects")
load("nvim-surround")
load("tabout.nvim")

-- Marks
load("harpoon")
load("vim-bookmarks")

-- Fuzzy Finder/Telescope
load("telescope.nvim")
load("telescope-media-files.nvim")
load("telescope-vim-bookmarks.nvim")

-- Note Taking
load("zk-nvim")

-- Color
load("nvim-colorizer.lua")
-- load("color-picker.nvim")
load("colortils.nvim")

-- Colorschemes
load("onedarker.nvim")
load("darkplus.nvim")
load("tokyonight.nvim")
-- load("colorschemes")

-- Utility
load("nvim-notify")
load("dressing.nvim")
load("cybu.nvim")
load("vim-bbye")
load("impatient.nvim")
load("browse.nvim")

-- Registers
load("registers.nvim")

-- Icon
load("nvim-web-devicons")

-- Debugging
load("nvim-dap")
load("nvim-dap-ui")
-- load("nvim-dap-virtual-text")
-- load("DAPInstall.nvim")

-- Tabline
-- load("bufferline.nvim")
-- load("scope.nvim")

-- Statusline
load("lualine.nvim")

-- Startup
load("alpha-nvim")

-- Indent
load("indent-blankline.nvim")

-- File Explorer
load("nvim-tree.lua")
load("lir.nvim")

-- Comment
load("Comment.nvim")
load("todo-comments.nvim")

-- Terminal
load("toggleterm.nvim")

-- Project
load("project.nvim")
load("nvim-spectre")

-- Session
load("auto-session")
load("session-lens")

-- Quickfix
load("nvim-bqf")

-- Code Runner
load("jaq-nvim")
load("lab.nvim")

-- Git
load("gitsigns.nvim")
load("git-blame.nvim")
load("gitlinker.nvim")
load("vim-gist")
load("webapi-vim")

-- Github
load("octo.nvim")

-- Editing Support
load("nvim-autopairs")
load("dial.nvim")
load("numb.nvim")
load("vim-matchup")
load("zen-mode.nvim")
-- load("true-zen.nvim")
load("neoscroll.nvim")
load("vim-slash")

-- Motion
load("hop.nvim")
-- load("eyeliner.nvim")

-- Keybinding
load("which-key.nvim")

-- Java
load("nvim-jdtls")

-- Rust
load("rust-tools.nvim")
load("crates.nvim")

-- Typescript TODO: set this up, also add keybinds to ftplugin
load("typescript.nvim")

-- Markdown
load("markdown-preview.nvim")
-- ft = "markdown",

-- Graveyard
-- load("nvim-treesitter-context")
-- load("iswap.nvim")
-- load("nvim-ts-rainbow")
-- load("telescope-ui-select.nvim")
-- load("telescope-file-browser.nvim")
-- load("cmp-npm") -- doesn't seem to work
-- load("JABS.nvim")
-- load("vim-solidity")
-- load("vim-repeat")
-- load("neovim-session-manager")
-- load("codi.vim")
-- load("NeoZoom.lua")
-- load("cmp-dap")
-- load("renamer.nvim")
-- load("conflict-marker.vim")
-- load("kanagawa.nvim")
-- load("quick-scope")
-- load(nlsp-settings.nvim") -- language server settings defined in json for
-- load("cutlass.nvim")
-- load("lsp-inlay-hints")
-- load("goto-preview")
-- load("aerial.nvim")
-- load("lsp_extensions.nvim")
-- load("nvim-gps")
-- load("stickybuf.nvim")
-- load("trouble.nvim")
-- load("tree-climber.nvim")
-- load("hop.nvim")
-- load("sniprun")
