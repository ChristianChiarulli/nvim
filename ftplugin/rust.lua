local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  L = {
    name = "Rust",
    h = { "<cmd>RustToggleInlayHints<Cr>", "Toggle Hints" },
    r = { "<cmd>RustRunnables<Cr>", "Runnables" },
    -- r = { "<cmd>lua _CARGO_RUN()<cr>", "Cargo Run" },
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
    c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
    p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
    -- j = { "<cmd>RustJoinLines<Cr>", "Join Lines" },
    -- s = { "<cmd>RustStartStandaloneServerForBuffer<Cr>", "Start Server Buf" },
    d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
    v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
    R = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      "Reload Workspace",
    },
    -- S = { "<cmd>RustSSR<Cr>", "SSR" },
    o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
    -- h = { "<cmd>RustSetInlayHints<Cr>", "Enable Hints" },
    -- H = { "<cmd>RustDisableInlayHints<Cr>", "Disable Hints" },
    -- a = { "<cmd>RustHoverActions<Cr>", "Hover Actions" },
    -- a = { "<cmd>RustHoverRange<Cr>", "Hover Range" },
    -- j = { "<cmd>RustMoveItemDown<Cr>", "Move Item Down" },
    -- k = { "<cmd>RustMoveItemUp<Cr>", "Move Item Up" },
  },
}

which_key.register(mappings, opts)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "message with no corresponding" then
    return
  end

  notify_filter(msg, ...)
end

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })
