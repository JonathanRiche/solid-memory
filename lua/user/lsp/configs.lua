local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = {
	"jsonls",
	"rust_analyzer",
	"sumneko_lua",
	"pyright",
	"jsonls",
	"tsserver",
	"taplo",
	"golangci_lint_ls",
	"html",
	"cssls",
	"svelte",
	"tailwindcss",
	"eslint"
}
lsp_installer.setup {
	ensure_installed = servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	if server == 'tsserver' then
		local ts = require('typescript')
		ts.setup(
			{
				server = {
					on_attach = opts.on_attach,
					capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
					root_dir = vim.loop.cwd

				}
			}
		)
	else

		lspconfig[server].setup(opts)
	end
end


--was using this for tsserver
--root_dir=vim.loop.cwd
