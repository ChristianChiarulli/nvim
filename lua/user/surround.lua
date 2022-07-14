local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup {
  keymaps = { -- vim-surround style keymaps
    insert = "<m-s>",
    insert_line = "<m-s><m-s>",
    visual = "<m-s>",
    delete = "<m-d>",
    change = "<m-c>",
  },
  delimiters = {
    pairs = {
      ["("] = { "( ", " )" },
      [")"] = { "(", ")" },
      ["{"] = { "{ ", " }" },
      ["}"] = { "{", "}" },
      ["<"] = { "< ", " >" },
      [">"] = { "<", ">" },
      ["["] = { "[ ", " ]" },
      ["]"] = { "[", "]" },
      -- Define pairs based on function evaluations!
      ["i"] = function()
        return {
          require("nvim-surround.utils").get_input "Enter the left delimiter: ",
          require("nvim-surround.utils").get_input "Enter the right delimiter: ",
        }
      end,
      ["f"] = function()
        return {
          require("nvim-surround.utils").get_input "Enter the function name: " .. "(",
          ")",
        }
      end,
    },
    separators = {
      ["'"] = { "'", "'" },
      ['"'] = { '"', '"' },
      ["`"] = { "`", "`" },
    },
    HTML = {
      ["t"] = "type", -- Change just the tag type
      ["T"] = "whole", -- Change the whole tag contents
    },
    aliases = {
      ["a"] = ">", -- Single character aliases apply everywhere
      ["b"] = ")",
      ["B"] = "}",
      ["r"] = "]",
      -- Table aliases only apply for changes/deletions
      ["q"] = { '"', "'", "`" }, -- Any quote character
      ["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
    },
  },
  highlight_motion = { -- Highlight before inserting/changing surrounds
    duration = 0,
  },
}
