return {
  {
    'echasnovski/mini.misc', version = '*',
    tag = "v0.9.0",
    config = function()
      require("mini.misc").setup()
      MiniMisc.setup_auto_root({".git"})
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    version = "0.0.10",
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
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
    },
  },
  {
    'TimUntersberger/neogit',
    commit = "68a3e90e9d1ed9e362317817851d0f34b19e426b",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup{}
    end,
  },
  {
    "boltlessengineer/bufterm.nvim",
    commit = "e2251bffcfb2117395e9bc1a82640f9671267e0d",
    config = function()
      require('bufterm').setup()
    end,
  },
}
