local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

local status_ok_1, _ = pcall(require, "lsp-inlayhints")
if not status_ok_1 then
  return
end

comment.setup {
  pre_hook = function(ctx)
    -- For inlay hints
    local line_start = (ctx.srow or ctx.range.srow) - 1
    local line_end = ctx.erow or ctx.range.erow
    require("lsp-inlayhints.core").clear(0, line_start, line_end)

    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}
