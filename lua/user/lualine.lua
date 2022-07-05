local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.onedarker_alt")
if not status_theme_ok then
  return
end

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#32363e" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#abb2bf", bg = "#32363e", bold = false })
-- vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D7BA7D", bg = "#252525" })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#abb2bf", bg = "#32363e" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#6b727f", bg = "#282c34" })
-- darkerplus
-- vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#303030" })
-- vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#abb2bf", bg = "#303030", bold = false })
-- -- vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D7BA7D", bg = "#252525" })
-- vim.api.nvim_set_hl(0, "SLProgress", { fg = "#abb2bf", bg = "#303030" })
-- vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#545862", bg = "#252525" })
local mode_color = {
  n = "#61afef",
  i = "#e06c75",
  v = "#c678dd",
  [""] = "#c678dd",
  V = "#c678dd",
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = "#56b6c2",
  no = "#61afef",
  s = "#d19a66",
  S = "#d19a66",
  [""] = "#d19a66",
  ic = "#e06c75",
  R = "#d19a66",
  Rv = "#e06c75",
  cv = "#61afef",
  ce = "#61afef",
  r = "#e06c75",
  rm = "#56b6c2",
  ["r?"] = "#56b6c2",
  ["!"] = "#56b6c2",
  t = "#98c379",
}

local mode = {
  -- mode component
  function()
    return "▊"
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()] }
  end,
  -- padding = { right = 1 },
  padding = 0,
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

-- local mode = {
--   "mode",
--   fmt = function(str)
--     return "-- " .. str .. " --"
--   end,
-- }

local filetype = {
  "filetype",
  icons_enabled = true,
  -- icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
  -- color = "Constant",
  colored = false,
}

local progress = {
  "progress",
  color = "SLProgress",
  -- fmt = function(str)
  --   print(vim.fn.expand(str))
  --   if str == "1%" then
  --     return "TOP"
  --   end
  --   if str == "100%" then
  --     return "BOT"
  --   end
  --   return str
  -- end,
  -- padding = 0,
}

-- local progress = {
--   "progress",
--   fmt = function(str)
--     print(vim.fn.expand(str))
--     if str == "1%" then
--       return "TOP"
--     end
--     if str == "100%" then
--       return "BOT"
--     end
--     return str
--   end,
--   -- padding = 0,
-- }

local current_signature = function()
  if not pcall(require, "lsp_signature") then
    return
  end
  local sig = require("lsp_signature").status_line(30)
  -- return sig.label .. "🐼" .. sig.hint
  return "%#SLSeparator#" .. sig.hint .. "%*"
end

-- cool function for progress
-- local progress = function()
--   local current_line = vim.fn.line "."
--   local total_lines = vim.fn.line "$"
--   local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--   local line_ratio = current_line / total_lines
--   local index = math.ceil(line_ratio * #chars)
--   -- return chars[index]
--   return "%#SLProgress#" .. chars[index] .. "%*"
-- end

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*",
}

local location = {
  "location",
  color = function()
    -- darkerplus
    -- return { fg = "#252525", bg = mode_color[vim.fn.mode()] }
    return { fg = "#1E232A", bg = mode_color[vim.fn.mode()] }
  end,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    -- theme = "auto",
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode, branch },
    lualine_b = { diagnostics },
    -- lualine_c = {},
    lualine_c = { { current_signature, cond = hide_in_width } },
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = { diff, spaces, filetype },
    lualine_y = { progress },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
