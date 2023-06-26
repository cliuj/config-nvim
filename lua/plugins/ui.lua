return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.2",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = "Telescope",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "2.64",
    cmd = "Neotree",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    config = function()
      local fn = vim.fn
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      fn.sign_define("DiagnosticSignHint",
        {text = "󰨼", texthl = "DiagnosticSignHint"})

      require("neo-tree").setup({
        close_if_last_window = false,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = false,

        window = {
          position = "right",
          width = 32,
        },
        buffers = {
          follow_current_file = false,
        },
      })
    end,
  },
  {
    "crispgm/nvim-tabline",
    commit = "7044c5b73678c7b0161f4c37acd0f555cc3ce908",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = true,
  },
  {
    "folke/which-key.nvim",
    version = "1.4.3",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n" , "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>f"] = { name = "+file/find" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.0",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('nvim-treesitter.configs').setup{
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        ensure_installed = {
          "bash",
          "c",
          "html",
          "javascript",
          "json",
          "lua",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "yaml",
          "norg",
        },
      }
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = "0.9.0",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "neo-tree",
          "lazy",
          "mason",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup{
        default_mappings = true;
      }
    end,
  },
}
