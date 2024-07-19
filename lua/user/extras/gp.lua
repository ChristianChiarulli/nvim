return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup {
      openai_api_key = "sk-proj-*",
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
      },
    }

    local wk = require "which-key"
    wk.add {
      {
        "<leader>aa",
        "<cmd>GpChatToggle vsplit<cr>",
        desc = "Toggle Chat",
      },
      {
        "<leader>an",
        "<cmd>GpChatNew vsplit<cr>",
        desc = "New Chat",
      },
      {
        "<leader>af",
        "<cmd>GpChatFinder<cr>",
        desc = "New Chat",
      },
      {
        "<leader>ar",
        "<cmd>GpChatRespond<cr>",
        desc = "Respond",
      },
      {
        "<leader>aw",
        "<cmd>GpRewrite<cr>",
        desc = "Rewrite",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        "<cmd>GpAppend<cr>",
        desc = "Append",
        mode = { "n", "v" },
      },
    }
  end,
}
