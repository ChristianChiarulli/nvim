local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  -- package_root = require("packer.util").join_paths(vim.fn.stdpath "data", "lvim", "pack"),
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

local plugins = {}

return require("packer").startup(function(use)
  local plugins_conf = {
  -- Packer can manage itself as an optional plugin
    { "wbthomason/packer.nvim" },
    "lv-telescope",
    { "neovim/nvim-lspconfig" },
    {
      "kabouzeid/nvim-lspinstall",
      event = "VimEnter",
      config = function()
        require("lspinstall").setup()
      end,
    },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "tjdevries/astronauta.nvim" },
    "lv-compe",
    "lv-autopairs",
    { "hrsh7th/vim-vsnip", event = "InsertEnter" },
    { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    { "nvim-treesitter/nvim-treesitter" },
    "lv-formatter",
    "lv-nvimtree",
    "lv-gitsigns",
    "lv-which-key",
    "lv-comment",
    { "kyazdani42/nvim-web-devicons" },
    "lv-galaxyline",
    "lv-barbar",
    "lv-dap",
    {
      "Pocco81/DAPInstall.nvim",
      -- event = "BufWinEnter",
      -- event = "BufRead",
      disable = not O.plugin.dap.active,
    },
    "lv-dashboard",
    "lv-floatterm",
    "lv-zen",
    "lv-indent",

    ---------------------------------------------------------------------------------

    -- LANGUAGE SPECIFIC GOES HERE
    {
      "lervag/vimtex",
      ft = "tex",
    },

    -- Rust tools
    -- TODO: use lazy loading maybe?
    {
      "simrat39/rust-tools.nvim",
      disable = not O.lang.rust.rust_tools.active,
    },

    -- Elixir
    { "elixir-editors/vim-elixir", ft = { "elixir", "eelixir", "euphoria3" } },

    -- Javascript / Typescript
    {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      ft = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    },

    {
      "mfussenegger/nvim-jdtls",
      -- ft = { "java" },
      disable = not O.lang.java.java_tools.active,
    },

    -- Custom semantic text objects
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      disable = not O.plugin.ts_textobjects.active,
    },

    -- Smart text objects
    {
      "RRethy/nvim-treesitter-textsubjects",
      disable = not O.plugin.ts_textsubjects.active,
    },

    -- Text objects using hint labels
    {
      "mfussenegger/nvim-ts-hint-textobject",
      event = "BufRead",
      disable = not O.plugin.ts_hintobjects.active,
    },
  }

  for _, plugin_conf in pairs(plugins_conf) do
    -- TODO: Find another way than checking the type
    if type(plugin_conf) == "string" then
      local ok, plugin = pcall(require, plugin_conf)
      if not ok then
        goto continue
        -- PRINT some error
      end
      use(plugin)
      table.insert(plugins, plugin)
      goto continue
    end
    use(plugin_conf)
    ::continue::
  end

  for _, plugin in pairs(O.user_plugins) do
    packer.use(plugin)
  end
end)
