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
