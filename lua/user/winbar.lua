local M = {}

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
  return
end

local function isempty(s)
  return s == nil or s == ""
end

M.filename = function()
  local filename = vim.fn.expand("%"):match "([^/]+)$"

  local extension = ""
  local file_icon = ""
  local file_icon_color = ""

  if not isempty(filename) then
    extension = filename:match "^.+(%..+)$"

    local default = false

    if isempty(extension) then
      extension = ""
      default = true
    else
      extension = extension:gsub("%.", "") -- remove . (. is a special character so we have to escape it)
    end

    file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = default })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
  end
end

M.gps = function()
  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return
  end

  local icons = require "user.icons"

  if not gps.is_available() then -- Returns boolean value indicating whether a output can be provided
    return
  end

  local retval = M.filename()

  if gps_location == "error" then
    return ""
  else
    if not isempty(gps_location) then
      return retval .. " " .. icons.ui.ChevronRight .. " " .. gps_location
    else
      return retval
    end
  end
end

return M
