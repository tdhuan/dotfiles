local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier,
	formatting.rescript,
	-- formatting.stylua,
	-- formatting.erb_lint,
	formatting.rubocop,
	formatting.shfmt,
	formatting.yapf,

	code_actions.eslint_d,

	-- diagnostics.rubocop,
	diagnostics.eslint_d,
	diagnostics.ruff,
}

null_ls.setup({
	-- add your sources / config options here
	-- cmd = { "nvim" },
	sources = sources,
	diagnostics_format = "[#{s} - #{c}] #{m}",
	debug = false,
})
