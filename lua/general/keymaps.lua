local map = vim.api.nvim_set_keymap

map('n', '<S-j>', '}', { noremap = true })
map('n', '<S-k>', '{', { noremap = true })
map('n', '<leader>w', '<C-w>', { noremap = true })

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })


-- Plugin keymaps (will error at startup if plugin is missing)
require("mason")
map('n', "<leader>cm", "<cmd>Mason<cr>", { noremap = true })

require("telescope")
map("n", "<leader>f", "<cmd>Telescope find_files find_command=fd,--hidden,--exclude,.git<cr>", { noremap = true })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { noremap = true })
map("n", "<leader>:", "<cmd>Telescope command_history<cr>", { noremap = true })
map("n", "<leader>b", "<cmd>Telescope buffers show_all_buffer=true<cr>", { noremap = true })

require("telescope").load_extension("project")
map("n", "<leader>p", "<cmd>Telescope project<cr>", { noremap = true })

require("neo-tree")
map("n", "<leader>l", "<cmd>Neotree filesystem reveal<cr>", { noremap = true })

require("luasnip")
map("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", { noremap = true})
map("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true})
map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true})

require("neogit")
map("n", "<leader>g", "<cmd>Neogit kind=vsplit<cr>", { noremap = true })

require("toggleterm")
map("n", "<leader>;", "<cmd>ToggleTerm<cr>", { noremap = true })
