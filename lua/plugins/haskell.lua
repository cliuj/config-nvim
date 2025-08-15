return {
  {
    "neovim/nvim-lspconfig",
    ft = { "haskell", "lhaskell" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.hls.setup({
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { "haskell", "lhaskell" },
        root_dir = lspconfig.util.root_pattern(
          "hie.yaml",
          "stack.yaml",
          "cabal.project",
          "*.cabal",
          "package.yaml",
          ".git"
        ),
        settings = {
          haskell = {
            formattingProvider = "ormolu",
          },
        },
      })
    end,
  },
}