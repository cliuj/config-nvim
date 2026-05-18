local map = vim.api.nvim_set_keymap

map('n', '<leader>w', '<C-w>', { noremap = true })

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

map('n', '<leader>g', '<cmd>Neogit<cr>', { noremap = true })
