local function map(mode, lhs, rhs, desc, opts)
  local options = {noremap = true, desc = desc}

  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- auto indent on empty line.
vim.keymap.set('n', 'i', function ()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil
         and 'cc' or 'i'
end, {expr=true, noremap=true})

-- navigation between windows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- don't copy on delete and change
map('n', 'd', '"_d')
map('v', 'd', '"_d')
map('n', 'c', '"_c')
map('v', 'c', '"_c')

-- exit from terminal
map('t', '<S-Esc>', '<C-\\><C-n>')

-- remove post-search highlight
map('n', '<C-m>', '<cmd>nohlsearch<CR>')

-- file tree keys
map('n', '<F5>', '<cmd>NvimTreeToggle<CR>', "Toggle NvimTree")

-- buffers keys
map('n', '<C-S-Tab>', '<cmd>BufferLinePick<CR>', 'Choose buffer')
map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', 'Next buffer')
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', 'Previous buffer')
map('n', '<C-S-e>', '<cmd>BufferLineMoveNext<CR>', 'Swap with next buffer')
map('n', '<C-S-q>', '<cmd>BufferLineMovePrev<CR>', 'Swap with previous buffer')

-- floating terminal
map('n', '<F6>', '<cmd>FloatermToggle<CR>', 'Toggle floating terminal')
map('t', '<F6>', '<C-\\><C-n><cmd>FloatermToggle<CR>', 'Detach from terminal and toggle it')
