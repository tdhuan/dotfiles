return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- change a keymap
    { "<leader>;", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  },
  opts = {
    defaults = {
      layout_strategy = "flex",
      layout_config = {
        flex = {
          flip_columns = 140, -- Switch to vertical layout when width is below 130 columns
        },
        horizontal = {
          width = 0.8,
          height = 0.8,
          preview_width = 0.5,
          mirror = false,
        },
        vertical = {
          preview_height = 0.45,
          width = 0.9, -- 90% of the screen
          height = 0.7, -- 90% of the screen
          mirror = true,
        },
      },
    },
  },
}
