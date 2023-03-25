local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

opt.splitright = true
opt.splitbelow = true

opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.copyindent = true

opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.completeopt = 'menu,noselect'
cmd 'autocmd BufEnter * set fo-=c fo-=r fo-=o'

opt.termguicolors = true
opt.mouse = 'a'
opt.encoding = 'utf-8'
