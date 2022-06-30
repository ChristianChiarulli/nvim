local status_ok, crates = pcall(require, "crates")
if not status_ok then
  return
end

crates.setup {
  popup = {
    -- autofocus = true,
    style = "minimal",
    border = "rounded",
    show_version_date = false,
    show_dependency_version = true,
    max_height = 30,
    min_width = 20,
    padding = 1,
  },
  null_ls = {
    enabled = true,
    name = "crates.nvim",
  },
}
