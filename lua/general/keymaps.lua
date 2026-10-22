local map = vim.api.nvim_set_keymap
local helpers = require('general.helpers')

map('n', '<leader>w', '<C-w>', { noremap = true })

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Readline-style line motions in insert mode (override rarely-used defaults)
vim.keymap.set('i', '<C-a>', '<C-o>^', { noremap = true, desc = 'Insert: go to first non-blank' })
vim.keymap.set('i', '<C-e>', '<End>',  { noremap = true, desc = 'Insert: go to end of line' })

-- Jump over a closing pair (bracket/quote) inserted by mini.pairs
vim.keymap.set('i', "<C-'>", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local next_char = line:sub(col + 1, col + 1)

  if next_char:match('[%)%]%}"\'`]') then
    return '<Right>'
  end

  return ''
end, { expr = true, desc = 'Jump over closing pair' })

vim.keymap.set('n', '<leader>g',  helpers.cmd_if('Neogit'),          { noremap = true, desc = 'Neogit' })
vim.keymap.set('n', '<leader>tm', helpers.cmd_if('Markview Toggle'), { noremap = true, desc = 'Toggle markview' })
vim.keymap.set('n', '<leader>f',  helpers.cmd_if('Pick files'),     { noremap = true, desc = 'Pick files' })
vim.keymap.set('n', '<leader>/',  helpers.cmd_if('Pick grep_live'), { noremap = true, desc = 'Pick grep_live' })
vim.keymap.set('n', '<leader>b',  helpers.cmd_if('Pick buffers'),   { noremap = true, desc = 'Pick buffers' })
vim.keymap.set('n', '<leader>h',  helpers.cmd_if('Pick help'),      { noremap = true, desc = 'Pick help' })

vim.keymap.set('n', '<leader>e', function() MiniFiles.open() end, { noremap = true, desc = 'MiniFiles (cwd)' })
vim.keymap.set('n', '<leader>E', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, { noremap = true, desc = 'MiniFiles (current file)' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, desc = 'Diagnostic float' })

vim.keymap.set('x', 'p', '"_dP', { noremap = true, desc = 'Paste without yanking selection' })

vim.keymap.set('n', '<leader>id', function()
    vim.api.nvim_put({ vim.fn.strftime('%Y-%m-%dT%H:%M:%S') }, 'c', true, true)
end, { noremap = true, desc = 'Insert ISO datetime' })

-- Cursor shape presets, toggled at runtime
do
  local term = 't:block-blinkon500-blinkoff500-TermCursor'

  -- Ordered list of named presets; <leader>tc cycles through them.
  local presets = {
    -- Mode-aware: block in normal/visual, vertical bar in insert (matches settings.lua)
    { name = 'mode',  value = 'n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,' .. term },
    { name = 'block', value = 'a:block-Cursor,' .. term },
    { name = 'line',  value = 'a:ver25-Cursor,' .. term },
  }

  local idx = 1

  local function apply(i)
    idx = i
    vim.opt.guicursor = presets[idx].value
    vim.notify('cursor: ' .. presets[idx].name)
  end

  -- :CursorShape mode|block|line  (no arg = cycle to next preset)
  vim.api.nvim_create_user_command('CursorShape', function(o)
    if o.args == '' then
      apply(idx % #presets + 1)
    else
      for i, p in ipairs(presets) do
        if p.name == o.args then return apply(i) end
      end
      vim.notify('unknown cursor preset: ' .. o.args, vim.log.levels.ERROR)
    end
  end, {
    nargs = '?',
    complete = function() return { 'mode', 'block', 'line' } end,
  })

  vim.keymap.set('n', '<leader>tc', function() apply(idx % #presets + 1) end,
    { noremap = true, desc = 'Cycle cursor shape' })
end

helpers.cabbrev('f',  'find')
helpers.cabbrev('fs', 'sfind')
helpers.cabbrev('fv', 'vert sfind')
helpers.cabbrev('ft', 'tabfind')
helpers.cabbrev('LP', 'LivePreview')
