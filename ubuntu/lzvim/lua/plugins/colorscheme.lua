return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material",
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_foreground = 'original'
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_better_performance = 1
    end

  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
