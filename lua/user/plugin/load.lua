local load = function(plugin, config)
  config = vim.deepcopy(config or {})

  local plugin_config = config["plugin_config"] or nil

  if vim.v.vim_did_enter == 1 then
    -- Modifies 'runtimepath' _and_ sources files.
    vim.cmd("packadd " .. plugin)
  else
    -- Just modifies 'runtimepath'; Vim will source the files later as part of
    -- |load-plugins| process.
    vim.cmd("packadd! " .. plugin)
  end

  if plugin_config == nil then
    return
  end

  if type(plugin_config) == "string" then
    -- Try execute its configuration
    -- NOTE: configuration file should have the same name as plugin directory
    pcall(require, "user." .. plugin_config)
  elseif type(plugin_config) == "function" then
    plugin_config()
  else
    return
  end
end

return load
