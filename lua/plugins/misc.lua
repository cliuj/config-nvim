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
          ["core.qol.todo_items"] = {
            config = {
              create_todo_items = true,
            },
          },
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
          ["core.journal"] = {
            config = {
              strategy = "flat",
            },
          },
          ["core.ui"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.integrations.telescope"] = {},
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
    commit = "7aae848dff66a24425b4dcaf0567c4620edf45be",
    config = function()
      require('bufterm').setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
}
