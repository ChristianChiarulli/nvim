local M = {
  "echasnovski/mini.nvim",
  version = false,
}
function M.config()
  require("mini.icons").setup()
  MiniIcons.mock_nvim_web_devicons()
end

return M
