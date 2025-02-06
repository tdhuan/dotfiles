return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      height = 0.85, -- 85% of the screen height
      width = 0.9, -- 90% of the screen width
      row = 0.3, -- Position the window 30% from the top
      col = 0.5, -- Center the window horizontally
      border = "rounded", -- Rounded border style
      preview = {
        layout = "flex", -- Show preview below the results
        vertical = "down:45%", -- up|down:size
        horizontal = "right:50%",
      },
    },
  },
  keys = {
    { "<leader>;", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
  },
}
