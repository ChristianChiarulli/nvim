local M = {
  "echasnovski/mini.cursorword",
  event = "VeryLazy",
}

function M.config()
  _G.cursorword_blocklist = function()
    local curword = vim.fn.expand "<cword>"
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")

    filetypes_denylist = {
      "mason",
      "harpoon",
      "DressingInput",
      "NeogitCommitMessage",
      "qf",
      "dirvish",
      "minifiles",
      "fugitive",
      "alpha",
      "NvimTree",
      "lazy",
      "NeogitStatus",
      "Trouble",
      "netrw",
      "lir",
      "DiffviewFiles",
      "Outline",
      "Jaq",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    }

    if vim.tbl_contains(filetypes_denylist, filetype) then
      vim.b.minicursorword_disable = true
      return
    end

    -- Add any disabling global or filetype-specific logic here
    local blocklist = {}
    -- if filetype == "lua" then
    --   -- blocklist = { "local", "require" }
    --   blocklist = { "*" }
    -- elseif filetype == "javascript" then
    --   -- blocklist = { "*" }
    -- end

    vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
  end

  -- Make sure to add this autocommand *before* calling module's `setup()`.
  vim.cmd "au CursorMoved * lua _G.cursorword_blocklist()"

  require("mini.cursorword").setup()
end

return M
