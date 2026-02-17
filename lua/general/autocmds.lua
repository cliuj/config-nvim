-- Disable auto commenting
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Show line diagnostics automatically in a hover window
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- Auto-reload files changed outside of Neovim
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold"}, {
  command = "silent! checktime",
})
