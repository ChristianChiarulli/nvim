local status_ok, hints = pcall(require, "lsp-inlayhints")
if not status_ok then
  return
end

hints.setup {
  tools = {
    inlay_hints = {
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      show_variable_name = false,
      -- parameter_hints_prefix = "<- ",
      -- type_hints_prefix = "-> ",
      max_len_align = false,
      -- other_hints_remove_colon = true,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
  },
}
