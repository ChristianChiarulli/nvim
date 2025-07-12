return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		-- Enable mason
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		-- require("mason-lspconfig").setup()

		-- Install formatters, and linters
		require("mason-tool-installer").setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"tailwindcss",
				"eslint",
				"rust_analyzer",
				"gopls",
				"html",
				"cssls",
				"basedpyright",
				"bashls",
				"css_variables",
				"cssmodules_ls",
				"dockerls",
				"grammarly",
				"jsonls",
				"lemminx",
				"marksman",
				"nginx_language_server",
				"taplo",
				"yamlls",

				"prettier", -- JavaScript/TypeScript formatter
				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import organizer
				"pylint", -- Python linter
				"shellcheck", -- Shell script linter
				"shfmt", -- Shell script formatter
			},
		})
	end,
}
