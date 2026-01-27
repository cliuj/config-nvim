return {
  -- Mason - manages LSP/tool installations (use :Mason to browse/install manually)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  -- Mason-tool-installer - auto-installs formatters, linters, etc.
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",
        "shfmt",
        -- Linters
        "shellcheck",
        "luacheck",
      },
    },
  },

  -- Mason-lspconfig - auto-installs and enables LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "jsonls",
        "hls",
        "bashls",
        "marksman",
        "pyright",
        "yamlls",
      },
    },
    config = function(_, opts)
      -- Global capabilities for all LSP servers (for blink.cmp completion)
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      -- Diagnostics configuration
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        severity_sort = true,
      })

      -- Server-specific settings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = { callSnippet = "Replace" },
            telemetry = { enable = false },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      })

      require("mason-lspconfig").setup(opts)
    end,
  },

  -- nvim-lspconfig - provides LSP configurations (loaded by mason-lspconfig)
  {
    "neovim/nvim-lspconfig",
    lazy = true,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      always_trigger = true,
      toggle_key = "<C-k>",
      floating_window_above_cur_line = true,
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        lua = { "luacheck" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
      }
      -- Auto-lint on save and insert leave
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Trouble: Better diagnostics list
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics (Trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
      { "]x", function()
          require("trouble").next({ skip_groups = true, jump = true })
        end, desc = "Next trouble item" },
      { "[x", function()
          require("trouble").prev({ skip_groups = true, jump = true })
        end, desc = "Prev trouble item" },
    },
    opts = {},
  },

  -- Syntax plugins
  { "elkowar/yuck.vim" },
  { "neovimhaskell/haskell-vim" },
  { "purescript-contrib/purescript-vim" },
  { "prisma/vim-prisma" },
  { "jparise/vim-graphql" },
}
