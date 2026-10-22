return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = { "markdown", "rmd" },
    config = function()
      require("mkdnflow").setup({
        mappings = {
          MkdnFoldSection = false,
          MkdnUnfoldSection = false,
        },
      })
    end,
  },
  {
    "brianhuster/live-preview.nvim",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
