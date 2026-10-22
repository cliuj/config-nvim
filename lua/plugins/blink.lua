return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      documentation = {
        auto_show = true,
        window = {
          direction_priority = {
            menu_north = { 'n', 's', 'e', 'w' },
            menu_south = { 'n', 's', 'e', 'w' },
            --menu_south = { 's', 'n', 'e', 'w' },
          },
        },
      },
    },
    keymap = {
      preset = "super-tab",
      ['<CR>'] = { 'accept', 'fallback' },
    },
    sources = {
      providers = {
        buffer = { score_offset = 3 },
        lsp = { score_offset = 0, fallbacks = {} },
      },
    },
  },
}
