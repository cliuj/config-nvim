return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Disable virtual text diagnostics
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.virtual_text = false

      return opts
    end,
    init = function()
      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        float = {
          border = "rounded",
          source = true,
          max_width = 120,
        },
      })
    end,
  },
}
