return {
  {
    "echasnovski/mini.misc",
    version = "*",
    config = function()
      require("mini.misc").setup()
      MiniMisc.setup_auto_root({ ".git" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- For `plugins/markview.lua` users.
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- Completion for `blink.cmp`
    dependencies = { "saghen/blink.cmp" },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
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
      require("colorizer").setup({})
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
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  -- Git signs in gutter + inline blame
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        -- Navigation
        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
      end,
    },
  },

  -- Commenting: gcc to toggle line, gc + motion for block
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {},
  },

  -- Buffer delete without closing window
  {
    "echasnovski/mini.bufremove",
    event = "VeryLazy",
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete buffer (force)" },
    },
    opts = {},
  },
}
