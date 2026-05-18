local map = vim.api.nvim_set_keymap
local helpers = require('general.helpers')

map('n', '<leader>w', '<C-w>', { noremap = true })

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

vim.keymap.set('n', '<leader>g',  helpers.cmd_if('Neogit'),          { noremap = true, desc = 'Neogit' })
vim.keymap.set('n', '<leader>tm', helpers.cmd_if('Markview Toggle'), { noremap = true, desc = 'Toggle markview' })
