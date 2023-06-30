return {
  {
    "cliuj/vim-dark-meadow",
    version = "1.0.0",
    lazy = false,
    priority = 1000,
  },
  {
    "cliuj/midnight-meadow.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      vim.cmd.colorscheme("midnight-meadow")
    end,
  }
}
