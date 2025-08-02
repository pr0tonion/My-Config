local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local mason_lspconfig = require("mason-lspconfig")

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


local opts = { noremap = true, silent = true }

-- Vim-like LSP keybindings (following vim conventions)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Diagnostics (vim-like with [ and ])
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>x", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Code actions and formatting
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
    },
  },
})

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls", -- Lua Language Server
        "pyright", -- Python Language Server
        "ruff", -- Python linter
    },
})

