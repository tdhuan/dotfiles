return {

  {
    "Exafunction/windsurf.vim",
    event = "BufEnter",
    config = function()
      -- Optional: disable default keybindings if you want custom ones:
      vim.g.codeium_disable_bindings = 1 -- turns off the built-in mappings

      -- Now define your own mappings (my personal picks):
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
}
