local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Define capabilities once
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Global diagnostics configuration
vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN, -- Show warnings and above
		},
	},
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Common on_attach function
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Keybindings for LSP
	vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostics", buffer = bufnr })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
	vim.keymap.set("n", "<leader>cc", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = bufnr })

	-- Formatting (if enabled by the LSP)
	if client.server_capabilities.documentFormattingProvider then
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code", buffer = bufnr })
	end
end

-- Mason setup
require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = { "lua_ls", "ruff" }, -- Only install lua_ls and ruff
	automatic_installation = true,        -- Automatically install missing servers
})

-- Mason LSP setup handlers
--require("mason-lspconfig").setup_handlers({
--	function(server_name) -- Default handler
--		lspconfig[server_name].setup({
--			capabilities = capabilities,
--			on_attach = on_attach,
--		})
--	end,
--})

-- Ruff setup
lspconfig.ruff.setup({
	init_options = {
		settings = {
			args = { "--ignore=E501" }, -- "--config=/path/to/pyproject.toml"  -- Use pyproject.toml for config
		},
	},
	on_attach = on_attach,
})
