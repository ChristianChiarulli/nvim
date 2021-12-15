local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
	return
end
spectre.setup({

	color_devicons = true,
	highlight = {
		ui = "String",
		search = "DiffChange",
		replace = "DiffDelete",
	},
	mapping = {
		["toggle_line"] = {
			map = "t",
			cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
			desc = "toggle current item",
		},
		["enter_file"] = {
			map = "<cr>",
			cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
			desc = "goto current file",
		},
		["send_to_qf"] = {
			map = "Q",
			cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
			desc = "send all item to quickfix",
		},
		["replace_cmd"] = {
			map = "c",
			cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
			desc = "input replace vim command",
		},
		["show_option_menu"] = {
			map = "o",
			cmd = "<cmd>lua require('spectre').show_options()<CR>",
			desc = "show option",
		},
		["run_replace"] = {
			map = "R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "replace all",
		},
		["change_view_mode"] = {
			map = "m",
			cmd = "<cmd>lua require('spectre').change_view()<CR>",
			desc = "change result view mode",
		},
		["toggle_ignore_case"] = {
			map = "I",
			cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
			desc = "toggle ignore case",
		},
		["toggle_ignore_hidden"] = {
			map = "H",
			cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
			desc = "toggle search hidden",
		},
		-- you can put your mapping here it only use normal mode
	},
	find_engine = {
		-- rg is map with finder_cmd
		["rg"] = {
			cmd = "rg",
			-- default args
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			options = {
				["ignore-case"] = {
					value = "--ignore-case",
					icon = "[I]",
					desc = "ignore case",
				},
				["hidden"] = {
					value = "--hidden",
					desc = "hidden file",
					icon = "[H]",
				},
				-- you can put any option you want here it can toggle with
				-- show_option function
			},
		},
		["ag"] = {
			cmd = "ag",
			args = {
				"--vimgrep",
				"-s",
			},
			options = {
				["ignore-case"] = {
					value = "-i",
					icon = "[I]",
					desc = "ignore case",
				},
				["hidden"] = {
					value = "--hidden",
					desc = "hidden file",
					icon = "[H]",
				},
			},
		},
	},
	replace_engine = {
		["sed"] = {
			cmd = "sed",
			args = nil,
		},
		options = {
			["ignore-case"] = {
				value = "--ignore-case",
				icon = "[I]",
				desc = "ignore case",
			},
		},
	},
	default = {
		find = {
			--pick one of item in find_engine
			cmd = "rg",
			options = { "ignore-case" },
		},
		replace = {
			--pick one of item in replace_engine
			cmd = "sed",
		},
	},
	replace_vim_cmd = "cdo",
	is_open_target_win = true, --open file on opener window
	is_insert_mode = false, -- start open panel on is_insert_mode
})
