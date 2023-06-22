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


-- Plugins
if require("mason") ~= nil then
  map('n', "<leader>cm", "<cmd>Mason<cr>", { noremap = true })
end

if require('telescope') ~= nil then
  map("n", "<leader>f", "<cmd>Telescope find_files find_command=fd,--hidden,--exclude,.git<cr>", { noremap = true })
  map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { noremap = true })
  map("n", "<leader>:", "<cmd>Telescope command_history<cr>", { noremap = true })
  map("n", "<leader>b", "<cmd>Telescope buffers show_all_buffer=true<cr>", { noremap = true })
end

if require('neo-tree') ~= nil then
  map("n", "<leader>p", "<cmd>Neotree filesystem reveal<cr>", { noremap = true })
end

if require('luasnip') ~= nil then
  map("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", { noremap = true})
  map("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", { noremap = true})
  map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", { noremap = true})
end

if require('neogit') ~= nil then
  map("n", "<leader>g", "<cmd>Neogit kind=vsplit<cr>", { noremap = true })
end

if require("lspconfig") ~= nil then
  map("n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true })
end
