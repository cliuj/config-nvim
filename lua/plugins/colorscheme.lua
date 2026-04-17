return {
  {
    "cliuj/midnight-meadow.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("midnight-meadow")
    end,
  },
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
