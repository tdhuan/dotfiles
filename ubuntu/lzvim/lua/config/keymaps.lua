-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function mergeWithDescription(options, description)
  -- Create a new table combining all values of options with the new key desc
  local newOpts = {}

  -- Copy old options into the new table
  for k, v in pairs(options) do
    newOpts[k] = v
  end

  -- Add the new key-value pair
  newOpts.desc = description

  return newOpts
end

map("n", "<leader>fw", ":w<CR>", mergeWithDescription(opts, "Write file"))
map("n", "<leader>fq", ":q<CR>", mergeWithDescription(opts, "Quit file"))
map("n", "<leader>vs", ":vsplit<CR>", mergeWithDescription(opts, "Vertical split window"))
map("n", "<leader>sp", ":split<CR>", mergeWithDescription(opts, "Split window"))
map("n", "<leader>nhl", ":nohlsearch<CR>", mergeWithDescription(opts, "No highlight search"))

map("n", "<Tab>", "<C-^>", mergeWithDescription(opts, "Switch between two files"))
map("n", "<C-A>", "gg<S-V>G<CR>", mergeWithDescription(opts, "Select all"))

map("v", "p", '"_dP', mergeWithDescription(opts, "Disable copy of replaced word"))

map("x", "J", ":move '>+1<CR>gv-gv", mergeWithDescription(opts, "Move text down"))
map("x", "K", ":move '<-2<CR>gv-gv", mergeWithDescription(opts, "Move text up"))
map("x", "<A-j>", ":move '>+1<CR>gv-gv", mergeWithDescription(opts, "Move text down"))
map("x", "<A-k>", ":move '<-2<CR>gv-gv", mergeWithDescription(opts, "Move text up"))

-- Get the current file path
-- https://vimtricks.com/p/get-the-current-file-path/
-- use "*p to patse it
map("n", "<leader>cp", ":let @*=expand('%')<CR>", mergeWithDescription(opts, "Get the current file path"))
