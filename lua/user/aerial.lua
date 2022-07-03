local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end

aerial.setup()
