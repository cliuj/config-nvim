return {
  {
    'echasnovski/mini.misc', version = '*',
    config = function()
      require("mini.misc") .setup()
      MiniMisc.setup_auto_root({".git"})
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    version = '*',
    event = "BufRead",
    build = ":call mkdp#util#install()",
  },
  {
    'nvim-neorg/neorg',
    build = ":Neorg sync-parsers",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                root = "~/documents/norg",
                notes = "~/documents/norg/notes",
                planner = "~/documents/norg/planners",
              },
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.ui"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.integrations.telescope"] = {},
          -- ["core.tempus"] = {}, -- Need neovim@v0.10.0
          -- ["core.ui.calendar"] = {}, -- Need neovim@v0.10.0
        },
      }

       local neorg_callbacks = require("neorg.callbacks")
       neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
           -- Map all the below keybinds only when the "norg" mode is active
           keybinds.map_event_to_mode("norg", {
               -- Bind keys in normal mode
               n = {
                   { "<C-s>", "core.integrations.telescope.find_linkable" },
               },
               -- Bind in insert mode
               i = {
                   { "<C-s>", "core.integrations.telescope.insert_link" },
                   { "<C-f>", "core.integrations.telescope.insert_file_link" },
               },
           }, {
               silent = true,
               noremap = true,
           })
       end)
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
    },
  },
}
