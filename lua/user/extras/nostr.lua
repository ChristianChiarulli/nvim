local M = {
  url = "git@github.com:ChristianChiarulli/nostr.nvim.git",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build ={ "cd rplugin/node/nostr && npm i",  ":UpdateRemotePlugins", }
}

function M.config()

    -- n = {
    --   name = "Nostr",
    --   k = { '<cmd>lua require("nostr").generate_keys()<cr>', "Generate Keys" },
    --   a = { '<cmd>lua require("nostr").add_relay()<cr>', "Add Relay" },
    --   r = { '<cmd>lua require("nostr").remove_relay()<cr>', "Remove Relay" },
    --   l = { '<cmd>lua require("nostr").list_relays()<cr>', "List Relays" },
    --   s = { '<cmd>lua require("nostr").set_active_relay()<cr>', "Set Active Relay" },
    --   S = { '<cmd>lua require("nostr").publish_snippet()<cr>', "Publish Snippet" },
    --   n = { '<cmd>lua require("nostr").publish_note()<cr>', "Publish Note" },
    --   d = { '<cmd>lua require("nostr").decode()<cr>', "Decode" },
    --   e = { '<cmd>lua require("nostr").encode()<cr>', "Encode" },
    --   b = { '<cmd>lua require("nostr").publish_blog()<cr>', "Publish Blog" },
    --   B = { '<cmd>lua require("nostr").publish_bounty()<cr>', "Publish Bounty" },
    -- },

  require("nostr").setup {}
end

return M
