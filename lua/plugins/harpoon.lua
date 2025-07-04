local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<S-m>", function()
			require("plugins.harpoon").mark_file()
		end)
		vim.keymap.set("n", "<TAB>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
}

function M.mark_file()
	require("harpoon"):list():add()
	vim.notify("󱡅  marked file")
end

return M
