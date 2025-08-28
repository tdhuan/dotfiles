return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      graphql = { "prettier" },
      ruby = { "rubocop" },
    },
    formatters = {
      rubocop = {
        timeout_ms = "5000",
        command = "bundle exec rubocop",
        args = {
          "--autocorrect-all",
          "--stdin",
          "$FILENAME",
          "--format",
          "quiet",
          "--stderr",
        },
      },
    },
  },
}
