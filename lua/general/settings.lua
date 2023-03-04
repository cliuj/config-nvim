local g = vim.g
local opt = vim.opt
local opt_local = vim.opt_local

-- Map leader to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Performance settings
opt.lazyredraw = true
opt.ttimeoutlen = 30
opt.updatetime = 300

-- Set shell
opt.shell = "fish"

opt.number = true

-- Cursor
opt.cursorline = true
opt.guicursor = "i:block"

-- Enable undo file
opt.undofile = true

-- Indentation
opt_local.expandtab = true
opt_local.smarttab = true
opt_local.autoindent = true

-- Backspace Indentation
opt.backspace = {"indent", "eol", "start"}

-- Disable viminfo
opt.viminfo = ""
opt.viminfofile = "NONE"

-- Misc
opt.clipboard = "unnamedplus"
opt.scrolloff = 5
opt.ignorecase = true
opt.mouse = "a"
opt.backup = false
opt.wrap = false
opt.swapfile = false
opt.cmdheight = 2

-- Splitting
opt.splitbelow = true
opt.splitright = true

