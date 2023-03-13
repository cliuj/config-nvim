return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = "Telescope",
    keys = {
      { "<leader>,", "<cmd>Telescope find_files find_command=fd,--hidden,--exclude,.git<cr>", desc = "Find Files (fd)"},
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (ripgrep)"},
      { "<leader>;", "<cmd>Telescope command_history<cr>", desc = "Command history"},
      { "<leader>b", "<cmd>Telescope buffers show_all_buffer=true<cr>", desc = "Switch Buffer"},
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      {"<leader>p", "<cmd>Neotree filesystem reveal<cr>", desc = "Open tree"},
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
        {text = "", texthl = "DiagnosticSignHint"})

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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = true,
  }
}
