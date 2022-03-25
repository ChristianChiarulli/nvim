vim.cmd[[filetype plugin on
]]
  local cmp = require('cmp')
local sources = cmp.get_config().sources
for i = #sources, 1, -1 do
  if sources[i].name == 'emoji' then
    table.remove(sources, i)
  end
end
cmp.setup.buffer({ sources = sources })
