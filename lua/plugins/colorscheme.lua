return {
  {
    "cliuj/midnight-meadow.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      vim.cmd.colorscheme("midnight-meadow")
    end,
  }
}
