-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_ruby_lsp = "solargraph"
vim.g.lazyvim_ruby_formatter = "rubocop"
vim.g.lazygit_config = false
local opt = vim.opt
opt.relativenumber = false
opt.wrap = true
opt.undofile = false
opt.swapfile = false -- creates a swapfile
