return {
  "akinsho/bufferline.nvim",
  --
  opts = {
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      numbers = function(opts)
        return string.format("%s", opts.ordinal, opts.id)
      end,
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      indicator = {
        icon = "▎",
        style = "icon",
      },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count)
        return "(" .. count .. ")"
      end,
      color_icons = true,
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      always_show_bufferline = true,
    },
  },
}
