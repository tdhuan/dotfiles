return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  {
    "andreypopp/vim-colors-plain",
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      disable_italics = true, -- Disable italics
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
      -- colorscheme = "rose-pine-main",
      -- colorscheme = "plain",
    },
  },
}
