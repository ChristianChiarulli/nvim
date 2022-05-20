local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

local icons = require "user.icons"

-- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = "#111fff" })
-- local fg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).background
-- local bg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).foreground

-- Customized config
gps.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. "", -- Classes and class-like objects
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. "", -- Functions
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. "", -- Methods (functions inside class-like objects)
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. "", -- Containers (example: lua tables)
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ", -- Tags (example: html tags)
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. "",
    ["sequence-name"] = "%CmpItemKindProperty#" .. icons.type.Array .. "%*" .. "",
    ["null-name"] = "%CmpItemKindField#" .. icons.kind.Field .. "%*" .. "",
    ["boolean-name"] = "%CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. "",
    ["integer-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. "",
    ["float-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. "",
    ["string-name"] = "%CmpItemKindValue#" .. icons.type.String .. "%*" .. "",
    ["array-name"] = "%CmpItemKindProperty#" .. icons.type.Array .. "%*" .. "",
    ["object-name"] = "%CmpItemKindProperty#" .. icons.type.Object .. "%*" .. "",
    ["number-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. "",
    ["table-name"] = "%CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. "",
    ["date-name"] = "%CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. "",
    ["date-time-name"] = "%CmpItemKindValue#" .. icons.ui.Table .. "%*" .. "",
    ["inline-table-name"] = "%CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. "",
    ["time-name"] = "%CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. "",
    ["module-name"] = "%CmpItemKindModule#" .. icons.kind.Module .. "%*" .. "",
  },

  -- Add custom configuration per language or
  -- Disable the plugin for a language
  -- Any language not disabled here is enabled by default
  -- languages = {
  -- 	-- Some languages have custom icons
  -- 	["json"] = {
  -- 		icons = {
  -- 		}
  -- 	},
  -- 	["toml"] = {
  -- 		icons = {
  -- 		}
  -- 	},
  -- 	["verilog"] = {
  -- 		icons = {
  -- 		}
  -- 	},
  -- 	["yaml"] = {
  -- 		icons = {
  -- 		}
  -- 	},

  -- Disable for particular languages
  -- ["bash"] = false, -- disables nvim-gps for bash
  -- ["go"] = false,   -- disables nvim-gps for golang

  -- Override default setting for particular languages
  -- ["ruby"] = {
  --	separator = '|', -- Overrides default separator with '|'
  --	icons = {
  --		-- Default icons not specified in the lang config
  --		-- will fallback to the default value
  --		-- "container-name" will fallback to default because it's not set
  --		["function-name"] = '',    -- to ensure empty values, set an empty string
  --		["tag-name"] = ''
  --		["class-name"] = '::',
  --		["method-name"] = '#',
  --	}
  --}
  -- },

  separator = " " .. icons.ui.ChevronRight .. " ",

  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,

  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
  text_hl = "LineNr"
}
