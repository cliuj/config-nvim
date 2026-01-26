return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    config = function()
      local project_actions = require("telescope._extensions.project.actions")
      require('telescope').setup {
        extensions = {
          project = {
            base_dirs = {
              "~/.config",
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            -- default for on_project_selected = find project files
            on_project_selected = function(prompt_bufnr)
              -- Do anything you want in here. For example:
              project_actions.change_working_directory(prompt_bufnr, false)
              vim.cmd[[Telescope find_files find_command=fd,--hidden,--exclude,.git]]
            end
          }
        }
      }
    end,
    cmd = "Telescope",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
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
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          }
        },

        window = {
          position = "left",
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
    event = "VeryLazy",
    opts = {
      plugins = { spelling = { enabled = true } },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "g", group = "goto" },
        { "]", group = "next" },
        { "[", group = "prev" },
        { "<leader>b", group = "buffer" },
        { "<leader>f", group = "file/find" },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_install = {
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
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      draw = {
        delay = 10,
      },
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
