return {
  {
    'echasnovski/mini.misc', version = '*',
    config = function()
      require("mini.misc") .setup()
      MiniMisc.setup_auto_root({".git"})
    end,
  },
}
