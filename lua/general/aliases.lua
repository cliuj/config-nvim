-- Neovim Aliases 

-- Alias to change to the `root` workspace, so that
-- newly journals will always be written to the correct directories
vim.api.nvim_create_user_command("Oj", function(opts)
  vim.api.nvim_command(":Neorg workspace root")
  vim.api.nvim_command(":Neorg journal " .. opts.args)
end, { nargs = '?'})

vim.cmd 'command! -nargs=* Org Neorg <args>'
