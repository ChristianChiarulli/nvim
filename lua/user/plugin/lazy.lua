SingularisArt.g.lazy = {}
SingularisArt.g.plugin_group = vim.api.nvim_create_augroup("PluginGroup", {
  clear = true,
})

local lazy_index = 0

local lazy = function(plugin, config)
  config = vim.deepcopy(config or {})

  -- As a convenience, accept: {'CommandA', 'CommandB'}
  -- and transform it into: {CommandA = true, CommandB = true}
  -- which is equivalent to: {CommandA = '', CommandB = ''} (ie. no opts)
  if config.commands ~= nil and vim.tbl_islist(config.commands) then
    local commands = {}
    for _, command in ipairs(config.commands) do
      commands[command] = true
    end
    config.commands = commands
  end

  local key = "_" .. lazy_index
  lazy_index = lazy_index + 1
  SingularisArt.g.lazy[key] = config

  config.load = function()
    if config.beforeload ~= nil then
      config.beforeload()
    end

    if config.commands ~= nil then
      for command in pairs(config.commands) do
        vim.cmd("delcommand " .. command)
      end
    end

    vim.cmd("packadd " .. plugin)

    if type(config.plugin_config) == "string" then
      -- Try execute its configuration
      -- NOTE: configuration file should have the same name as plugin directory
      pcall(require, "SingularisArt.config." .. config.plugin_config)
    elseif type(config.plugin_config) == "function" then
      config.plugin_config()
    end

    if config.keymap ~= nil then
      for _, item in ipairs(config.keymap) do
        local modes = item[1]
        local lhs = item[2]
        local rhs = item[3]
        local opts = item[4] or {}
        vim.keymap.set(modes, lhs, rhs, opts)
      end
    end

    if config.afterload ~= nil then
      config.afterload()
    end

    SingularisArt.g.lazy[key] = nil
  end

  if config.commands ~= nil then
    for command, opts in pairs(config.commands) do
      if opts == true then
        -- TODO: consider supporting type(opts) == 'table' in future
        -- eg. {nargs = '?', bar = true, bang = true} etc
        opts = ""
      end
      vim.cmd(
        "command! "
          .. opts
          .. " "
          .. command
          .. " "
          .. ":call v:lua.SingularisArt.g.lazy."
          .. key
          .. ".load() <bar> "
          .. command
          .. " <args>"
      )
    end
  end

  if config.keymap ~= nil then
    for _, item in ipairs(config.keymap) do
      local modes = item[1]
      local lhs = item[2]
      local rhs = ":call v:lua.SingularisArt.g.lazy." .. key .. ".load()<CR>" .. item[3]
      local opts = item[4] or {}
      vim.keymap.set(modes, lhs, rhs, opts)
    end
  end

  if config.commands == nil and config.keymap == nil then
    -- No triggers defined, so just load this thing after startup.
    -- vim.defer_fn(config.load, 0)
    SingularisArt.vim.autocmd("VimEnter", config.pattern or "*", function()
      vim.defer_fn(config.load, 0)
    end)
  else
    -- `packadd!` adds directories to 'runtimepath', so things like `:help`
    -- will work, but Vim won't load the plugin files as long as we do this
    -- _after_ startup.
    if vim.v.vim_did_enter == 1 then
      vim.cmd("packadd! " .. plugin)
    else
      SingularisArt.vim.autocmd("VimEnter", config.pattern or "*", function()
        vim.cmd("packadd! " .. plugin)
      end)
    end
  end
end

return lazy
