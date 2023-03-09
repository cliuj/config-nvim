return {
  {
    'echasnovski/mini.misc', version = '*',
    config = function()
      require("mini.misc") .setup()
      MiniMisc.setup_auto_root({".git"})
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    version = '*',
    event = "BufRead",
    build = ":call mkdp#util#install()",
  },
}
