return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "1.2.1",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    commit = "fa492591fecdc41798cd5d3d1713232a5088fba0",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
    	"hrsh7th/cmp-path",
    	"saadparwaiz1/cmp_luasnip",
      "nvim-neorg/neorg",
      "uga-rosa/cmp-dictionary",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.scroll_docs(-4),
          ["<C-n>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            }
          },
          { name = "path" },
          { name = "neorg"},
          {
            name = "dictionary",
            keyword_length = 2,
          },
        }),
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    "uga-rosa/cmp-dictionary",
    opts = {
      exact = 2,
      first_case_insensitive = false,
      document = false,
      document_command = "wn %s -over",
      async = false,
      sqlite = false,
      max_items = -1,
      capacity = 5,
      debug = false,
    },
    config = function(_, opts)
      local dict = require("cmp_dictionary")
      dict.setup(opts)
      dict.switcher({
        spelllang = {
          en = "/usr/share/dict/usa"
        },
      })
    end
  },
  {
    "echasnovski/mini.pairs",
    tag = "v0.9.0",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
}
