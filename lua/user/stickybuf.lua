local status_ok, stickybuf = pcall(require, "stickybuf")
if not status_ok then
  return
end

stickybuf.setup {
  -- 'bufnr' will pin the exact buffer (PinBuffer)
  -- 'buftype' will pin the buffer type (PinBuftype)
  -- 'filetype' will pin the filetype (PinFiletype)
  buftype = {
    [""] = false,
    acwrite = false,
    help = "buftype",
    nofile = false,
    nowrite = false,
    quickfix = "buftype",
    terminal = false,
    prompt = "bufnr",
  },
  wintype = {
    autocmd = false,
    popup = "bufnr",
    preview = false,
    command = false,
    [""] = false,
    unknown = false,
    floating = false,
  },
  filetype = {
    aerial = "filetype",
    nerdtree = "filetype",
    NvimTree = "filetype",
    lir = "filetype",
    ["neotest-summary"] = "filetype",
  },
  bufname = {
    ["Neogit.*Popup"] = "bufnr",
  },
  -- Some autocmds for plugins that need a bit more logic
  -- Set to `false` to disable the autocmd
  autocmds = {
    -- Only pin defx if it was opened as a split (has fixed height/width)
    defx = [[au FileType defx if &winfixwidth || &winfixheight | silent! PinFiletype | endif]],
    -- Only pin fern if it was opened as a split (has fixed height/width)
    fern = [[au FileType fern if &winfixwidth || &winfixheight | silent! PinFiletype | endif]],
    lir = [[au FileType fern if &winfixwidth || &winfixheight | silent! PinFiletype | endif]],
    -- Only pin neogit if it was opened as a split (there is more than one window)
    neogit = [[au FileType NeogitStatus,NeogitLog,NeogitGitCommandHistory if winnr('$') > 1 | silent! PinFiletype | endif]],
  },
}
