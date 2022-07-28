local status_ok, lab = pcall(require, "lab")
if not status_ok then
  return
end

lab.setup {
  code_runner = {
    enabled = true,
  },
  quick_data = {
    enabled = false,
  },
}

vim.cmd [[
  nnoremap <m-4> :Lab code run<CR>
  nnoremap <m-5> :Lab code stop<CR>
  nnoremap <m-6> :Lab code panel<CR>
]]
