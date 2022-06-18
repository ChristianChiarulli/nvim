local M = {}

M.bopen = {}

local ui = vim.api.nvim_list_uis()[1]

M.current_buf = ""

M.terminal_count = 0
M.terminal_map = {}

M.win_conf = {
  width = 40,
  height = 10,
  style = "minimal",
  border = "rounded",
  -- anchor = "NW",
  -- TODO: fine a good way to center in window later
  -- relative = "win",
  relative = "editor",
  row = (ui.height / 2) - (10 / 2),
  col = (ui.width / 2) - (40 / 2),
}

M.openOptions = {
  window = "b %s",
  vsplit = "vert sb %s",
  hsplit = "sb %s",
}

local get_bufs = function()
  local bufs = {}
  local cwd_path = vim.fn.getcwd() .. "/"
  for _, id in ipairs(vim.api.nvim_list_bufs()) do
    local buf_info = vim.fn.getbufinfo(id)[1]
    if buf_info.listed == 1 then
      -- print(vim.inspect(buf_info.bufnr))
      -- print(vim.inspect(buf_info))
      -- TODO: this is unecessary
      table.insert(bufs, {
        id = id,
        name = string.gsub(buf_info.name, cwd_path, ""),
        changed = buf_info.changed,
        hidden = buf_info.hidden,
        lnum = buf_info.lnum,
        lastused = buf_info.lastused,
        bufnr = buf_info.bufnr,
      })
    end
  end
  return bufs
end

-- Open buffer from line
function M.selBufNum(win, opt, count)
  local buf = nil
  local filename = nil

  if count ~= 0 then
    vim.notify "count wasn't 0, idk why"
  else
    buf = vim.api.nvim_get_current_line()
    filename = buf:split(" ", true)[3]

    if filename:split("_", true)[1] == "Terminal" then
      filename = M.terminal_map[filename]
    end
  end

  M.close()

  if not filename then
    print "Buffer number not found!"
    return
  end

  vim.api.nvim_set_current_win(win)
  vim.cmd(string.format(M.openOptions[opt], filename))
end

-- Close buffer from line
function M.closeBufNum(win)
  local l = vim.api.nvim_get_current_line()
  local buf = l:split(" ", true)[3]

  local current_buf = vim.api.nvim_win_get_buf(win)
  local bfs_buf = vim.api.nvim_get_current_buf()
  local new_current_buf = vim.api.nvim_buf_get_name(current_buf)
  local cwd_path = vim.fn.getcwd() .. "/"
  local cur_buf_name = string.gsub(new_current_buf, cwd_path, "")

  if buf ~= cur_buf_name then
    vim.cmd(string.format("bd %s", buf))
    local ln = vim.api.nvim_win_get_cursor(0)[1]
    table.remove(M.bopen, ln - 1)

    M.refresh(bfs_buf)
  else
    vim.api.nvim_notify("Cannot close current buffer!", 3, {})
  end

  vim.wo.number = false
  vim.wo.relativenumber = false
end

function M.close()
  xpcall(function()
    vim.api.nvim_win_close(M.main_win, false)
    vim.api.nvim_buf_delete(M.main_buf, {})
    M.main_win = nil
    M.main_buf = nil
  end, function()
    M.main_win = nil
    M.main_buf = nil
    M.open()
  end)
end

-- Set floating window keymaps
function M.setKeymaps(win, buf)
  vim.api.nvim_buf_set_option(buf, "filetype", "bfs")
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "<CR>",
    string.format([[:<C-U>lua require'user.bfs'.selBufNum(%s, 'window', vim.v.count)<CR>]], win),
    { nowait = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "q",
    ':lua require"user.bfs".close()<CR>',
    { nowait = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "d",
    string.format([[:lua require'user.bfs'.closeBufNum(%s)<CR>]], win),
    { nowait = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "l",
    string.format([[:<C-U>lua require'user.bfs'.selBufNum(%s, 'window', vim.v.count)<CR>]], win),
    { nowait = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "s",
    string.format([[:<C-U>lua require'user.bfs'.selBufNum(%s, 'hsplit', vim.v.count)<CR>]], win),
    { nowait = true, noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "v",
    string.format([[:<C-U>lua require'user.bfs'.selBufNum(%s, 'vsplit', vim.v.count)<CR>]], win),
    { nowait = true, noremap = true, silent = true }
  )
end

M.set_buffers = function(buf)
  for i, b in ipairs(get_bufs()) do
    local filename = b.name
    local changed = b.changed

    local changed_icon = ""
    local padding = 0

    if changed == 1 then
      changed_icon = ""
      padding = 1
    end

    local extension = ""
    extension = filename:match "^.+(%..+)$"

    if filename:sub(1, 7) == "term://" then
      M.terminal_count = M.terminal_count + 1
      M.terminal_map["Terminal_" .. tostring(M.terminal_count) .. ":"] = filename
      filename = "Terminal_" .. tostring(M.terminal_count) .. filename:gsub("^.*:", ': "')
      filename = filename:gsub('"', "")
      extension = ""
    end

    local hl_group = "FileIconColor"
    if not (extension == nil or extension == " " or extension == "") then
      extension = extension:gsub("%.", "") -- remove . (. is a special character so we have to escape it)
      hl_group = hl_group .. extension
    else
      if filename:split(" ", true)[1] == "Terminal:" then
        hl_group = hl_group .. "term"
      else
        hl_group = hl_group .. filename:gsub("%W", "")
      end
    end

    local file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(
      filename,
      extension,
      { default = true }
    )

    -- TODO: refactor this
    if filename:split(" ", true)[1] == "Terminal:" then
      hl_group = hl_group .. "term"
      file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(
        "terminal",
        extension,
        { default = true }
      )
    end

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    local line = " " .. file_icon .. " " .. filename .. " " .. changed_icon

    local max_width = M.win_conf.width
    local linenr = b.lnum
    local empty = {}
    empty[#empty + 1] = string.rep(" ", max_width)
    vim.api.nvim_buf_set_lines(buf, i - 1, -1, false, empty)
    vim.api.nvim_buf_set_text(buf, i - 1, 0, i - 1, line:len(), { line })
    vim.api.nvim_buf_set_text(
      buf,
      i - 1,
      max_width - tostring(linenr):len() + padding,
      i - 1,
      max_width,
      { " " .. linenr }
    )
    vim.api.nvim_buf_add_highlight(buf, -1, hl_group, i - 1, 3, 4)

    if b.bufnr == M.current_buf then
      vim.api.nvim_buf_add_highlight(buf, -1, "Visual", i - 1, 0, -1)
    end
  end
end

function M.refresh(buf)
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  M.set_buffers(buf)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
end

M.open = function()
  local back_win = vim.api.nvim_get_current_win()

  M.current_buf = vim.api.nvim_win_get_buf(back_win)

  if not M.main_buf and not M.main_win then
    M.main_buf = vim.api.nvim_create_buf(false, true)
    M.main_win = vim.api.nvim_open_win(M.main_buf, 1, M.win_conf)
    M.refresh(M.main_buf)
    M.setKeymaps(back_win, M.main_buf)
  end
end

return M
