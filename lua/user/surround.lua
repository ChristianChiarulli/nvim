local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup {
  keymaps = { -- vim-surround style keymaps
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "s",
    normal_cur = "ss",
    normal_line = "S",
    normal_cur_line = "SS",
    visual = "s",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
  },
  -- TODO: come back and fix this
  -- surrounds = {
  --   pairs = {
  --     ["("] = { "( ", " )" },
  --     [")"] = { "(", ")" },
  --     ["{"] = { "{ ", " }" },
  --     ["}"] = { "{", "}" },
  --     ["<"] = { "< ", " >" },
  --     [">"] = { "<", ">" },
  --     ["["] = { "[ ", " ]" },
  --     ["]"] = { "[", "]" },
  --     -- Define pairs based on function evaluations!
  --     ["i"] = function()
  --       return {
  --         require("nvim-surround.utils").get_input "Enter the left delimiter: ",
  --         require("nvim-surround.utils").get_input "Enter the right delimiter: ",
  --       }
  --     end,
  --     ["f"] = function()
  --       return {
  --         require("nvim-surround.utils").get_input "Enter the function name: " .. "(",
  --         ")",
  --       }
  --     end,
  --   },
  --   separators = {
  --     ["'"] = { "'", "'" },
  --     ['"'] = { '"', '"' },
  --     ["`"] = { "`", "`" },
  --   },
  --   HTML = {
  --     ["t"] = "type", -- Change just the tag type
  --     ["T"] = "whole", -- Change the whole tag contents
  --   },
  --   aliases = {
  --     ["a"] = ">", -- Single character aliases apply everywhere
  --     ["p"] = ")",
  --     ["b"] = "]",
  --     ["r"] = "}",
  --     -- Table aliases only apply for changes/deletions
  --     ["q"] = { '"', "'", "`" }, -- Any quote character
  --     ["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
  --   },
  --   invalid_key_behavior = function()
  --     vim.notify ("Invalid surround character", vim.log.levels.INFO)
  --   end,
  -- },
  -- highlight = { -- Highlight before inserting/changing surrounds
  --   duration = 0,
  -- },
}

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>'", [[ysiw']], opts)

vim.cmd [[nmap <leader>' siw']]
