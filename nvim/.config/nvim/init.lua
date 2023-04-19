-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ";"

-- vim.cmd("filetype off")
vim.cmd("filetype plugin on")
-- vim.cmd("filetype plugin indent on")
vim.cmd("let g:coc_filetype_map = {'vimwiki': 'markdown'}")
vim.bo.filetype = true
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
vim.opt.spell = true
vim.opt.spelllang = {"en", "de"}
vim.opt.number = true
vim.opt.colorcolumn = "80"

require('plugins')
require('coc-config')
require('numbertoggle')
require('nvim_tree')
require('vimwiki')

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
vim.api.nvim_set_keymap("n", "<leader>f", ":filetype detect<cr>", {silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>t", ":filetype detect<cr>", {silent = true})

vim.api.nvim_set_keymap("n", "ff", ":Files<cr>", {silent = true, noremap = true})

vim.cmd [[autocmd BufWritePre <buffer> :CocCommand ltex.checkCurrentDocument]]

vim.cmd [[autocmd BufReadPost :filetype detect]]
vim.cmd [[autocmd BufEnter <buffer> :filetype detect]]
vim.cmd [[autocmd BufWrite <buffer> :filetype detect]]
-- vim.cmd [[autocmd BufWrite <buffer> :filetype detect]]

-- vim.cmd('inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"')
--
-- vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible()", {silent=false})
vim.cmd('au filetype vimwiki silent! iunmap <buffer> <CR>')
