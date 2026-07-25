return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "bash",
        "zsh",
        "json",
        "javascript",
        "typescript",
        "lua",
        "ruby",
        "go",
        "css",
        "scss",
        "graphql",
        "yaml",
        "markdown",
        "markdown_inline",
        "html",
      })
    end,
  },
}
