return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "cliuj/midnight-meadow.nvim",
    },
  },
  event = "VeryLazy",
  config = function()
    local colors = require("midnight-meadow.colors").palette
    local bubbles_theme = {
      normal = {
        a = { fg = colors.thistle, bg = colors.green },
        b = { fg = colors.thistle, bg = colors.grey23 },
        c = { fg = colors.thistle, bg = colors.none },
      },

      insert = { a = { fg = colors.black, bg = colors.teal } },
      visual = { a = { fg = colors.black, bg = colors.sky_blue } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.thistle, bg = colors.black },
        b = { fg = colors.thistle, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
      },
    }
    require('lualine').setup({
      options = {
          theme = bubbles_theme,
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
