local M = {
	"jinh0/eyeliner.nvim",
}

function M.config()
	require("eyeliner").setup({
		highlight_on_key = true,
		dim = true,
        disabled_filetypes = { "neo-tree", "qf" },
	})
end

return M
