-- Basic settings
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.wo.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.wo.relativenumber = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Enable LSP logging
vim.lsp.set_log_level("debug")

-- Define global map function
_G.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Load Lazy plugin manager configuration
require("config.lazy")

require("mason").setup()
-- Load configurations
require("config.telescope-remap")
require("config.treesitter-config")
require("config.remaps")
require("config.cmp-config")
require("config.lsp-config")
require("config.luasnip-config")
require("config.dap-config")  -- Load DAP configuration


-- Setup Mason-nvim-dap
require("mason-nvim-dap").setup({
    ensure_installed = { "python" },
    automatic_installation = true,
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
        python = function(config)
            config.adapters = {
                type = "executable",
                command = vim.fn.exepath('python'),
                args = {
                    "-m",
                    "debugpy.adapter",
                },
            }
            require('mason-nvim-dap').default_setup(config)
        end,
    },
})

-- Load VSCode-like snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Set colorscheme
vim.cmd.colorscheme("catppuccin")
