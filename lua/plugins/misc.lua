return {
  {
    'echasnovski/mini.misc', version = '*',
    config = function()
      require("mini.misc").setup()
      MiniMisc.setup_auto_root({".git"})
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    event = "BufRead",
    build = ":call mkdp#util#install()",
  },

  {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
  },
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = "*",
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
      { "luarocks.nvim" },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      kind = "split",
      log_view = {
        kind = "split",
      },
      commit_editor = {
        kind = "split",
      },
    },
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup{}
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
