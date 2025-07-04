local function search_projects()
	local history = require("project_nvim.utils.history")
	local recent_projects = history.get_recent_projects()

	-- Create formatted entries with project names
	local entries = {}
	for _, project_path in ipairs(recent_projects) do
		local project_name = vim.fn.fnamemodify(project_path, ":t")
		table.insert(entries, string.format("%-30s %s", project_name, project_path))
	end

	require("fzf-lua").fzf_exec(entries, {
		prompt = "Projects> ",
		actions = {
			["default"] = function(selected)
				if selected and #selected > 0 then
					-- Extract the path from the formatted string
					local path = selected[1]:match("%s+(.+)$")
					vim.cmd("cd " .. path)
					-- close current buffer (maybe close all buffers?)
					-- vim.cmd("bd")
					-- close all buffers
					vim.cmd("bufdo bd")
					-- Optional: Open file tree or do other actions
					vim.cmd("Neotree reveal")
				end
			end,
		},
	})
end

-- Create a command
vim.api.nvim_create_user_command("Projects", search_projects, {})

-- Or map it to a key
vim.keymap.set("n", "<leader>fp", search_projects, { desc = "Find projects" })
