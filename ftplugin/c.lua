local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
    return
  end

  notify_filter(msg, ...)
end
