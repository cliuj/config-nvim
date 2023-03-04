local g = vim.g
local opt = vim.opt

g.t_Co = 256
g.syntax = "on"
g.termguicolors = true
opt.background = "dark"

-- Highlight colors for {} [] ()
vim.cmd([[hi MatchParen cterm=NONE ctermfg=NONE]])
