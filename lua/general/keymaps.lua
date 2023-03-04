local map = vim.api.nvim_set_keymap

map('n', '<S-j>', '}', { noremap = true })
map('n', '<S-k>', '{', { noremap = true })
map('n', ';', ':', { noremap = true })

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

vim.cmd([[
  " Hotkey to check highlight groups
  nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
]])
