return {
  {
    --dir = "~/develop/hazel.nvim",
    "cliuj/hazel.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme("hazel-light")
    end,
  },
  {
    dir = "~/Develop/midnight-meadow.nvim",
    "cliuj/midnight-meadow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- "original" | "soft" | "muted" | "meadow"
      variant = "soft",
    },
    config = function(_, opts)
      require("midnight-meadow").setup(opts)
      --vim.cmd.colorscheme("midnight-meadow")
    end,
  },
  {
    "Aejkatappaja/sora",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("sora").setup(opts)
      --vim.cmd("colorscheme sora")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    opts = {
      transparent = false,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variants = {
        modus_vivendi = "default",
      },
    },
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      --require('onedark').load()
    end
  },
  {
    "4513ECHO/vim-colors-hatsunemiku",
    priority = 1000,
  },
  {
    "mofiqul/vscode.nvim",
    priority = 1000,
  }
}
