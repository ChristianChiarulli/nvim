require("config.options")
require("config.keymaps")
require("config.autocommands")
require("config.lazy")
require("config.colorscheme")

vim.lsp.enable({ "luals", "pyright" })
