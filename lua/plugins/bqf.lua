local M = {
	"kevinhwang91/nvim-bqf",
	event = "VeryLazy",
}

function M.config()
	require("bqf").setup({
		auto_enable = true,
		magic_window = true,
		auto_resize_height = false,
		preview = {
			auto_preview = false,
			show_title = true,
			delay_syntax = 50,
			wrap = false,
		},
		func_map = {
			tab = "t",
			openc = "o",
			drop = "O",
			split = "s",
			vsplit = "v",
			stoggleup = "M",
			stoggledown = "m",
			stogglevm = "m",
			filterr = "f",
			filter = "F",
			prevhist = "<",
			nexthist = ">",
			sclear = "c",
			ptoggleitem = "p",
			ptoggleauto = "a",
			ptogglemode = "P",
		},
	})
	vim.keymap.set("n", "<leader>qc", function()
		vim.fn.setqflist({})
		vim.cmd("cclose") -- Optional: also close the quickfix window
	end, { desc = "Clear quickfix list" })

	local function toggle_quickfix()
		local windows = vim.fn.getwininfo()
		for _, win in pairs(windows) do
			if win["quickfix"] == 1 then
				vim.cmd("cclose")
				return
			end
		end
		vim.cmd("copen")
	end

	vim.keymap.set("n", "<leader>qq", toggle_quickfix, { desc = "Toggle quickfix list" })
end

return M
