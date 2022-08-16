local fn = vim.fn
vim.opt.termguicolors = true

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup({
  function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim", tag = "v0.6" }


    -- use "tiagovla/scope.nvim"
    use { "akinsho/bufferline.nvim", tag = 'v2.*', requires = "kyazdani42/nvim-web-devicons" }
    use "moll/vim-bbye"
    use "christianchiarulli/lualine.nvim"
    use { "akinsho/toggleterm.nvim", tag = "v2.*" }
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    -- use "christianchiarulli/hop.nvim"
    use "phaazon/hop.nvim"
    -- Lua
    use "kylechui/nvim-surround"
    -- Lua
    use {
      "abecodes/tabout.nvim",
      wants = { "nvim-treesitter" }, -- or require if not used so far
    }
    use "nacro90/numb.nvim"
    use "monaqa/dial.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "windwp/nvim-spectre"
    use "kevinhwang91/nvim-bqf"
    use "ThePrimeagen/harpoon"
    use "MattesGroeger/vim-bookmarks"
    -- use "Mephistophiles/surround.nvim"
    use { "michaelb/sniprun", run = "bash ./install.sh" }
    use {

      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
    }
    -- use "stevearc/stickybuf.nvim"

    use "christoomey/vim-tmux-navigator"

    -- UI
    use "stevearc/dressing.nvim"
    use "ghillb/cybu.nvim"
    use { "christianchiarulli/nvim-gps", branch = "text_hl" }
    use "tversteeg/registers.nvim"
    use "rcarriga/nvim-notify"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "tamago324/lir.nvim"
    use "goolord/alpha-nvim"
    use "folke/which-key.nvim"
    use "folke/zen-mode.nvim"
    -- use "karb94/neoscroll.nvim"
    use "folke/todo-comments.nvim"
    use "andymass/vim-matchup"

    -- Colorschemes
    use "folke/tokyonight.nvim"
    use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"
    use "morhetz/gruvbox"
    use "jacoborus/tender.vim"
    use "lunarvim/onedarker.nvim"
    use "NLKNguyen/papercolor-theme"

    -- cmp plugins
    use { "hrsh7th/nvim-cmp" }
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"
    use {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
    }

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "simrat39/symbols-outline.nvim"
    use "ray-x/lsp_signature.nvim"
    use "b0o/SchemaStore.nvim"
    use "folke/trouble.nvim"
    use "github/copilot.vim"
    -- use {
    --   "zbirenbaum/copilot.lua",
    --   event = { "VimEnter" },
    --   config = function()
    --     vim.defer_fn(function()
    --       require "user.copilot"
    --     end, 100)
    --   end,
    -- }
    -- use {
    --   "zbirenbaum/copilot-cmp",
    --   module = "copilot_cmp",
    -- }
    use "RRethy/vim-illuminate"
    use "stevearc/aerial.nvim"
    use "j-hui/fidget.nvim"
    -- TODO: set this up
    -- use "rmagatti/goto-preview"
    use "nvim-lua/lsp_extensions.nvim"

    -- -- Java
    -- use "mfussenegger/nvim-jdtls"

    -- Rust
    use "simrat39/rust-tools.nvim"
    use "Saecki/crates.nvim"

    -- Typescript TODO: set this up, also add keybinds to ftplugin
    use "jose-elias-alvarez/typescript.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "tom-anders/telescope-vim-bookmarks.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "lalitmee/browse.nvim"

    -- Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"
    use "windwp/nvim-ts-autotag"
    use "drybalka/tree-climber.nvim"

    -- Git
    use "lewis6991/gitsigns.nvim"
    use "f-person/git-blame.nvim"
    use "ruifm/gitlinker.nvim"
    use "mattn/vim-gist"
    use "mattn/webapi-vim"

    -- DAP
    -- use "mfussenegger/nvim-dap"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "rcarriga/nvim-dap-ui"
    -- use "Pocco81/DAPInstall.nvim"

    -- restart last session when starting neovim without arguments
    -- use "Shatur/neovim-session-manager"

    use {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    }

    -- Plugin Graveyard
    -- use "romgrk/nvim-treesitter-context"
    -- use "mizlan/iswap.nvim"
    -- use {'christianchiarulli/nvim-ts-rainbow'}
    -- use "nvim-telescope/telescope-ui-select.nvim"
    -- use "nvim-telescope/telescope-file-browser.nvim"
    -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
    -- use { "christianchiarulli/JABS.nvim" }
    -- use "lunarvim/vim-solidity"
    -- use "tpope/vim-repeat"
    -- use "Shatur/neovim-session-manager"
    -- use "metakirby5/codi.vim"
    -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
    -- use "rcarriga/cmp-dap"
    -- use "filipdutescu/renamer.nvim"
    -- use "https://github.com/rhysd/conflict-marker.vim"
    -- use "rebelot/kanagawa.nvim"
    -- use "unblevable/quick-scope"
    -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    -- use "gbprod/cutlass.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    max_jobs = 10,
  }
})
