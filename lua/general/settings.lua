local g = vim.g
local opt = vim.opt

-- Map leader to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Performance settings
opt.ttimeoutlen = 30
opt.updatetime = 300

-- Set shell
opt.shell = "fish"

opt.number = true
opt.relativenumber = false

-- Cursor
opt.cursorline = true
--opt.guicursor = "i:block"

-- Enable undo file
opt.undofile = true

-- Indentation
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

-- Backspace Indentation
opt.backspace = {"indent", "eol", "start"}

-- Disable viminfo
opt.viminfo = ""
opt.viminfofile = "NONE"

-- Misc
opt.scrolloff = 5
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.backup = false
opt.wrap = false
opt.swapfile = false
opt.cmdheight = 2

-- Splitting
opt.splitbelow = true
opt.splitright = true

opt.colorcolumn = "80"

opt.hidden = true

opt.conceallevel = 2

-- Folds
opt.foldcolumn = "auto"
opt.fillchars = {
   vert = "│", -- alternatives │
   fold = " ",
   eob = " ", -- suppress ~ at EndOfBuffer
   diff = "╱", -- alternatives = ⣿ ░ ─
   msgsep = "‾",
   foldopen = "▾",
   foldsep = "│",
   foldclose = "▸",
}

-- Clipboard
-- Setup 'clipboard' support
g.clipboard = {
  name = 'cb',
  copy = {
    ['+'] = 'cb copy',
    ['*'] = 'cb copy',
  },
  paste = {
    ['+'] = 'cb paste',
    ['*'] = 'cb paste',
  },
  cache_enabled = true,
}
opt.clipboard = "unnamedplus"
