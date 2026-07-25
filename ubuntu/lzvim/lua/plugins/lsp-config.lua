return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      solargraph = {
        cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
      },
      astro = {
        before_init = function(_, config)
          local util = require("lspconfig.util")
          local tsdk = util.get_typescript_server_path(config.root_dir)
          if tsdk == "" then
            local npm_root = vim.fn.systemlist("npm root -g")
            if vim.v.shell_error == 0 and npm_root and npm_root[1] ~= "" then
              tsdk = npm_root[1] .. "/typescript/lib"
            end
          end
          config.init_options = config.init_options or {}
          config.init_options.typescript = config.init_options.typescript or {}
          config.init_options.typescript.tsdk = tsdk
        end,
      },
    },
    setup = {
      astro = function(_, opts)
        vim.lsp.config("astro", opts)
        vim.lsp.enable("astro")
        return true
      end,
    },
  },
}
