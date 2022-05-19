local M = {}

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
  return
end

M.gps = function()

  -- local file_path = vim.fn.expand("%")

  if not gps.is_available() then  -- Returns boolean value indicating whether a output can be provided
    return
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return
  end
  if gps_location == "error" then
    return ""
  else
    return gps_location
  end
end

return M
