return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- change a keymap
    { "<leader>;", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  },
  opts = {
    defaults = {
      layout_config = {
        horizontal = {
          preview_width = 0.45,
          width = 0.9, -- 90% of the screen
          height = 0.9, -- 90% of the screen
        },
      },
    },
  },
}
