local status_ok, cutlass = pcall(require, "cutlass")
if not status_ok then
  return
end

cutlass.setup {
  {
    cut_key = nil,
    override_del = nil,
    exclude = {},
  },
}
