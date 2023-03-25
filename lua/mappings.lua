local function map(mode, lhs, rhs, desc, opts)
  local options = {noremap = true, desc = desc}

  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- navigation between windows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- don't copy on delete
map('n', 'd', '"_d')
map('v', 'd', '"_d')

-- exit from terminal
map('t', '<S-Esc>', '<C-\\><C-n>')

-- remove post-search highlight
map('n', '<C-l>', '<cmd>nohlsearch<CR>')


-- file tree keys
map('n', '<F5>', '<cmd>NvimTreeToggle<CR>', "Toggle NvimTree")

-- buffers keys
map('n', '<C-S-Tab>', '<cmd>BufferLinePick<CR>', 'Choose buffer')
map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', 'Next buffer')
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', 'Previous buffer')
map('n', '<C-S-e>', '<cmd>BufferLineMoveNext<CR>', 'Swap with next buffer')
map('n', '<C-S-q>', '<cmd>BufferLineMovePrev<CR>', 'Swap with previous buffer')

