local M = {}

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
  return
end

local function isempty(s)
  return s == nil or s == ""
end

local function has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

M.gps = function()
  local winbar_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha"
  }

  if has_value(winbar_filetype_exclude, vim.bo.filetype) then
    return
  end

  -- print(vim.bo.filetype)

  local filename = vim.fn.expand("%"):match "([^/]+)$"

  local extension = ""
  local file_icon = ""
  local file_icon_color = ""

  if not isempty(filename) then
    extension = filename:match "^.+(%..+)$"

    local default = false

    if isempty(extension) then
      extension = " "
      default = true
    else
      extension = extension:gsub("%.", "") -- remove . (. is a special character so we have to escape it)
    end

    file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = default })
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return
  end

  local icons = require "user.icons"

  local hl_group = "FileIconColor" .. extension

  vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
  -- vim.api.nvim_set_hl(0, "Test", { bg = "#fff111" })
  -- vim.api.nvim_set_hl(0, "WinBarContent", { fg = colors.green, bg = colors.grey })

  if not gps.is_available() then -- Returns boolean value indicating whether a output can be provided
    -- print(filename)
    -- if not isempty(filename) then
    --   return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
    --   -- return filename
    -- else
      return
    -- end
  end

  if gps_location == "error" then
    return ""
  else
    if not isempty(gps_location) then
      return " "
        .. "%#"
        .. hl_group
        .. "#"
        .. file_icon
        .. "%*"
        .. " "
        .. "%#LineNr#"
        .. filename
        .. "%*"
        .. " "
        .. icons.ui.ChevronRight
        .. " "
        .. gps_location
    else
      return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
    end
  end
end

return M
