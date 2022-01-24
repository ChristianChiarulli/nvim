vim.cmd [[
try
  colorscheme codemonkey 
catch /^Vim\%((\a\+)\)\=:E185/
  set background=dark
endtry
]]
vim.cmd [[hi Normal ctermbg=none guibg=NONE]]
vim.cmd [[hi SignColumn ctermbg=none guibg=NONE]]
vim.cmd [[hi NormalNC ctermbg=none guibg=NONE]]
vim.cmd [[hi MsgArea ctermbg=none guibg=NONE]]
vim.cmd [[hi TelescopeBorder ctermbg=none guibg=NONE]]
vim.cmd [[hi NvimTreeNormal ctermbg=none guibg=NONE]]
vim.cmd [[hi EndOfBuffer ctermbg=none guibg=NONE]]
