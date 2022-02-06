local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

-- Customized config
gps.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["class-name"] = "  ", -- Classes and class-like objects
    ["function-name"] = "  ", -- Functions
    ["method-name"] = "  ", -- Methods (functions inside class-like objects)
    ["container-name"] = "  ", -- Containers (example: lua tables)
    ["tag-name"] = "  ", -- Tags (example: html tags)
    ["mapping-name"] = "  ",
    ["sequence-name"] = "  ",
    ["null-name"] = "  ",
    ["boolean-name"] = "  ",
    ["integer-name"] = "  ",
    ["float-name"] = "  ",
    ["string-name"] = "  ",
    ["array-name"] = "  ",
    ["object-name"] = "  ",
    ["number-name"] = "  ",
    ["table-name"] = "  ",
    ["date-name"] = "  ",
    ["date-time-name"] = "  ",
    ["inline-table-name"] = "  ",
    ["time-name"] = "  ",
    ["module-name"] = "  ",
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

  separator = " > ",

  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,

  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
}
