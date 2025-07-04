return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		config = function()
			local opts = {
				cmdline = {
					keymap = {
						preset = "inherit",
						["<C-j>"] = { "select_next", "fallback" },
						["<C-k>"] = { "select_prev", "fallback" },
					},
				},

				keymap = {

					-- - `show`: Shows the completion menu
					--     - Optionally use `function(cmp) cmp.show({ providers = { 'snippets' } }) end` to show with a specific list of providers
					-- - `show_and_insert`: Shows the completion menu and inserts the first item
					--     - Short form for `cmp.show({ initial_selected_item_idx = 1 })` when `auto_insert = true`
					-- - `hide`: Hides the completion menu
					-- - `cancel`: Reverts `completion.list.selection.auto_insert` and hides the completion menu
					-- - `accept`: Accepts the currently selected item
					--     - Optionally pass an index to select a specific item in the list: `function(cmp) cmp.accept({ index = 1 }) end`
					--     - Optionally pass a `callback` to run after the item is accepted: `function(cmp) cmp.accept({ callback = function() some_function() end`
					-- - `accept_and_enter`: Accepts the currently selected item and feeds an enter key to neovim
					--     - Useful in `cmdline` mode to accept the current item and run the command
					-- - `select_and_accept`: Accepts the currently selected item, or the first item if none are selected
					-- - `select_accept_and_enter`: Accepts the currently selected item, or the first item if none are selected, and feeds an enter key to neovim
					--     - Useful in `cmdline` mode to accept the current item and run the command
					-- - `select_prev`: Selects the previous item, cycling to the bottom of the list if at the top, if `completion.list.cycle.from_top == true`
					--     - Optionally control the `auto_insert` property of `completion.list.selection`: `function(cmp) cmp.select_prev({ auto_insert = false }) end`
					--     - Optionally, run when ghost text is visible, instead of only when the menu is visible: `function(cmp) cmp.select_prev({ on_ghost_text = true })`
					-- - `select_next`: Selects the next item, cycling to the top of the list if at the bottom, if `completion.list.cycle.from_bottom == true`
					--     - Optionally control the `auto_insert` property of `completion.list.selection`: `function(cmp) cmp.select_next({ auto_insert = false }) end`
					--     - Optionally, run when ghost text is visible, instead of only when the menu is visible: `function(cmp) cmp.select_next({ on_ghost_text = true })`
					-- - `insert_prev`: Inserts the previous item (`auto_insert`), cycling to the bottom of the list if at the top, if `completion.list.cycle.from_top == true`. This will trigger completions if none are available, unlike `select_prev` which would fallback to the next keymap in this case.
					-- - `insert_next`: Inserts the next item (`auto_insert`), cycling to the top of the list if at the bottom, if `completion.list.cycle.from_bottom == true`. This will trigger completions if none are available, unlike `select_next` which would fallback to the next keymap in this case.
					-- - `show_documentation`: Shows the documentation for the currently selected item
					-- - `hide_documentation`: Hides the documentation
					-- - `scroll_documentation_up`: Scrolls the documentation up by 4 lines
					--     - Optionally use `function(cmp) cmp.scroll_documentation_up(4) end` to scroll by a specific number of lines
					-- - `scroll_documentation_down`: Scrolls the documentation down by 4 lines
					--     - Optionally use `function(cmp) cmp.scroll_documentation_down(4) end` to scroll by a specific number of lines
					-- - `show_signature`: Shows the signature help window
					-- - `hide_signature`: Hides the signature help window
					-- - `snippet_forward`: Jumps to the next snippet placeholder
					-- - `snippet_backward`: Jumps to the previous snippet placeholder
					-- - `fallback`: Runs the next non-blink keymap, or runs the built-in neovim binding
					-- - `fallback_to_mappings`: Runs the next non-blink keymap (not built-in behavior)

					-- set to 'none' to disable the 'default' preset
					preset = "default",
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<CR>"] = { "select_and_accept", "fallback" },

					-- >lua
					--     {
					--       -- optionally, inherit the mappings from the top level `keymap`
					--       -- instead of using the neovim defaults
					--       -- preset = 'inherit',
					--
					--       ['<Tab>'] = { 'show_and_insert', 'select_next' },
					--       ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
					--
					--       ['<C-space>'] = { 'show', 'fallback' },
					--
					--       ['<C-n>'] = { 'select_next', 'fallback' },
					--       ['<C-p>'] = { 'select_prev', 'fallback' },
					--       ['<Right>'] = { 'select_next', 'fallback' },
					--       ['<Left>'] = { 'select_prev', 'fallback' },
					--
					--       ['<C-y>'] = { 'select_and_accept' },
					--       ['<C-e>'] = { 'cancel' },
					-- }
				},

				fuzzy = {
					implementation = "lua",
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = { documentation = { auto_show = false } },
				sources = {
					default = { "codeium", "lazydev", "lsp", "path", "snippets", "buffer" },
					providers = {
						codeium = { name = "Codeium", module = "codeium.blink", async = true },
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
			}
			require("blink.cmp").setup(opts)
		end,
	},
}
