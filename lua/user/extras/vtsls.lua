local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
    mode = "n",   -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local M = {
    event = "VeryLazy",
    "yioneko/nvim-vtsls",
    config = function()
        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "help",
              "man",
              "lspinfo",
              "spectre_panel",
              "lir",
              "DressingSelect",
              "tsplayground",
              "",
            },
            callback = function()
                local mappings = {
                    c = {
                        name = "Tools➡(javascript)",
                        R = { "<cmd>VtsExec rename_file<Cr>", "[R]ename file" },
                        C = { "<cmd>VtsExec goto_project_config<cr>", "open [c]onfig" },
                        d = { "<cmd>VtsExec goto_source_definition<Cr>", "source [d]efenition" },
                        r = { "<cmd>VtsExec file_references<Cr>", "file [r]eferences" },
                        o = { "<cmd>VtsExec organize_imports<Cr>", "[o]rganize imports" },
                        s = { "<cmd>VtsExec sort_imports<Cr>", "[s]ort imports" },
                        U = { "<cmd>VtsExec remove_unused_imports<Cr>", "remove [U]nused imports" },
                        f = { "<cmd>VtsExec fix_all<Cr>", "[f]ix all" },
                        u = { "<cmd>VtsExec remove_unused<Cr>", "remove [u]nused" },
                        m = { "<cmd>VtsExec add_missing_imports<Cr>", "add [m]issing imports" },
                        a = { "<cmd>VtsExec source_actions<Cr>", "source [a]ctions" },
                        t = { "<cmd>VtsExec select_ts_version<Cr>", "select [t]s version" },
                        p = { "<cmd>VtsExec reload_projects<Cr>", "reload [p]rojects" },
                    },
                }
                
                which_key.register(mappings, opts)
            end,
          })
          
    end
}

return M




