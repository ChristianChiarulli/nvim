vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "query",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    local dirname = vim.fn.getcwd():match "([^/]+)$"
    vim.opt.titlestring = dirname
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

if vim.fn.executable "hyprctl" == 1 then
  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    callback = function()
      os.execute 'hyprctl activewindow -j | jq -r ".address" | xargs -I {} hyprctl setprop address:{} forceopaque 1 lock'
    end,
  })

  vim.api.nvim_create_autocmd({ "VimLeave" }, {
    pattern = { "*" },
    callback = function()
      os.execute 'hyprctl activewindow -j | jq -r ".address" | xargs -I {} hyprctl setprop address:{} forceopaque 0 lock'
    end,
  })
end
