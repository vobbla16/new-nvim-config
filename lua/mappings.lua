local wk = require("which-key")


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



vim.g.mapleader = ' '

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

-- telescope
--  basic
wk.register({
	f = {
		name = "Telescope"
	},
	c = {
		name = "Code"
	}
}, { prefix = "<leader>" })

map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', 'Find files')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live grep')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Buffers')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', 'Help tags')

--  lsp
map('n', '<leader>cr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'References')
map('n', '<leader>cs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', 'Symbols')
map('n', '<leader>cd', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', 'Diagnostics')
map('n', '<leader>ci', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'Implementations')
map('n', '<leader>cd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'Definitions')
