local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.darkplus_dark")
if not status_theme_ok then
  return
end

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#303030" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#D4D4D4", bg = "#303030", bold = false })
-- vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D7BA7D", bg = "#252525" })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D4D4D4", bg = "#303030" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#808080", bg = "#252525" })
local mode_color = {
  n = "#569cd6",
  i = "#6a9955",
  v = "#c586c0",
  [""] = "#c586c0",
  V = "#c586c0",
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = "#4EC9B0",
  no = "#569cd6",
  s = "#ce9178",
  S = "#ce9178",
  [""] = "#ce9178",
  ic = "#dcdcaa",
  R = "#d16969",
  Rv = "#d16969",
  cv = "#569cd6",
  ce = "#569cd6",
  r = "#d16969",
  rm = "#4EC9B0",
  ["r?"] = "#4EC9B0",
  ["!"] = "#4EC9B0",
  t = "#D7BA7D",
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
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

-- local lineNum = vim.api.nvim_win_get_cursor(0)[1]
local function getLines()
  return tostring(vim.api.nvim_win_get_cursor(0)[1]) .. "/" .. tostring(vim.api.nvim_buf_line_count(0))
end

local function getColumn()
  local val = vim.api.nvim_win_get_cursor(0)[2]
  -- pad value to 3 units to stop geometry shift
  return string.format("%03d", val)
end

local diff = {
  "diff",
  colored = true,
  color_added = "#a7c080",
  color_modified = "#ffdf1b",
  color_removed = "#ff6666",
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
local mode = {
  "mode",
  fmt = function(str)
    return "" .. str .. ""
  end,
}

local filetype = {
  "filetype",
  icons_enabled = true,
  -- icon = nil,
  icon = nil,
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
    return { fg = "#252525", bg = mode_color[vim.fn.mode()] }
  end,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local nvim_gps = function()
  local gps_location = gps.get_location()
  if gps_location == "error" then
    return ""
  else
    return gps.get_location()
  end
end

local function getWords()
  if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
    if vim.fn.wordcount().visual_words == 1 then
      return tostring(vim.fn.wordcount().visual_words) .. " word"
    elseif not (vim.fn.wordcount().visual_words == nil) then
      return tostring(vim.fn.wordcount().visual_words) .. " words"
    else
      return tostring(vim.fn.wordcount().words) .. " words"
    end
  else
    return ""
  end
end

-- TODO: find out what is overriding this
vim.opt.laststatus = 3

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    -- theme = "auto",
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    section_separators = { left = "", right = "" },
    -- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
    disabled_filetypes = { "alpha", "dashboard", "toggleterm", "NvimTree" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode, branch },
    lualine_b = { diagnostics },
    lualine_c = { { current_signature, cond = hide_in_width } },
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = { diff, spaces, filetype },
    lualine_y = { progress },
    lualine_z = { location },
    lualine_c = {},
    -- lualine_c = {
    --   { nvim_gps, cond = hide_in_width },
    -- },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diagnostics, spaces, "encoding" },
    lualine_y = { filetype },
    lualine_z = { 
      { getColumn, padding = { left = 1, right = 0 } },
      { getLines, icon = "", padding = 1 },
    },
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
