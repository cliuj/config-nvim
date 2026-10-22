setlocal tabstop=2
setlocal shiftwidth=2

" Disable blink's super-tab in markdown; defer to mkdnflow for table cells,
" fall back to inserting a tab character otherwise.
inoremap <buffer><silent><expr> <Tab>
      \ getline('.') =~# '<Bar>' ? '<Cmd>lua require("mkdnflow").tables.moveToCell(0, 1)<CR>' : '<Tab>'
inoremap <buffer><silent><expr> <S-Tab>
      \ getline('.') =~# '<Bar>' ? '<Cmd>lua require("mkdnflow").tables.moveToCell(0, -1)<CR>' : '<S-Tab>'
