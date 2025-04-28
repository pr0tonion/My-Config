local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')


require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "pyright" },
}

require("mason-lspconfig").setup_handlers({
	function(server_name)                              -- Default handler (for all servers)
		lspconfig[server_name].setup({
			capabilities = cmp_nvim_lsp.default_capabilities(), -- Enable completion capabilities
		})
	end,
})

lspconfig.pyright.setup({
	capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Attach nvim-cmp capabilities to LSP
})

map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Go to next error" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cc", vim.lsp.buf.completion, { desc = "Code completion" })
