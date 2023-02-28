-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("filetype plugin on")
vim.cmd("syntax on")

vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ruler = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.errorbells = false
vim.opt.spelllang = {"en", "de"}
vim.opt.number = true
vim.opt.colorcolumn = "80"

require('plugins')
require('coc')
require('numbertoggle')
require('nvim_tree')

-- themeing
vim.opt.termguicolors = true
vim.o.backgound = "dark"
vim.cmd("colorscheme gruvbox")
vim.cmd("highlight Normal guibg=none")
vim.cmd("let g:gruvbox_contrast_dark = 'hard'")
vim.cmd("let g:gruvbox_invert_selection = '0'")

vim.api.nvim_set_keymap("", "<C-h>", "<C-w>h", {silent = true, noremap = true})
vim.api.nvim_set_keymap("", "<C-j>", "<C-w>j", {silent = true, noremap = true})
vim.api.nvim_set_keymap("", "<C-k>", "<C-w>k", {silent = true, noremap = true})
vim.api.nvim_set_keymap("", "<C-l>", "<C-w>l", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "ff", ":Files<cr>", {silent = true, noremap = true})

