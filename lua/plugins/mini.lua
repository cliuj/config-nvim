return {
  {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.pick').setup({
        mappings = {
          choose_in_split = '<C-x>', -- horizontal split (was <C-s>)
          mark            = '<C-s>', -- moved off <C-x>, onto the freed split key
        },
      })
      require('mini.extra').setup()
      require('mini.files').setup()

      vim.api.nvim_create_user_command('Colo', function()
        MiniExtra.pickers.colorschemes()
      end, {})
      require('mini.sessions').setup({
        autoread = true,
        autowrite = true,
      })

      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
            if buf.name ~= '' then
              MiniSessions.write('Session.vim')
              return
            end
          end
        end,
      })
    end,
  },
}
