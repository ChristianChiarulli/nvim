local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}
function M.config()
  local devicons = require "nvim-web-devicons"

  devicons.setup {
    -- TODO: idk why this doesn't work
    -- override = {
    --   ["README.md"] = {
    --     icon = "",
    --     color = "#519aba",
    --     name = "README.md",
    --   },
    -- },
  }

  devicons.set_icon {
    astro = {
      --  󱓟 
      icon = "󱓞",
      color = "#FF7E33",
      name = "astro",
    },
    lockb = {
      icon = "",
      color = "#cbcb41",
      name = "lockb",
    },
    -- ["bunfig.toml"] = {
    --   icon = "󰳮",
    --   color = "#fbf0df",
    --   name = "bunfig.toml",
    -- },
    ["tsx"] = {
      icon = "",
      color = "#519aba",
      cterm_color = "26",
      name = "Tsx",
    },
    toml = {
      icon = "",
      color = "#6e8086",
      name = "toml",
    },
    [".npmignore"] = {
      icon = "",
      color = "#c63c42",
      name = ".npmignore",
    },
    ["tsconfig.tsbuildinfo"] = {
      icon = "",
      color = "#cbcb41",
      name = "tsconfig.tsbuildinfo",
    },
  }
end

return M
