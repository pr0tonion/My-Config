-- Basic vim settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Essential vim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Better defaults for vim-like experience
vim.opt.ignorecase = true      -- Ignore case in searches
vim.opt.smartcase = true       -- Override ignorecase if search contains uppercase
vim.opt.incsearch = true       -- Show matches while typing
vim.opt.hlsearch = true        -- Highlight search matches
vim.opt.wrap = false           -- Don't wrap lines
vim.opt.scrolloff = 8          -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8      -- Keep 8 columns left/right of cursor

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart autoindenting

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Define global map function for consistency
_G.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Load plugin manager
require("config.lazy")

-- Load configurations in logical order
require("config.vim-settings")    -- Additional vim settings first
require("config.remaps")           -- Basic keymaps
require("config.treesitter-config")
require("config.cmp-config")
require("config.lsp-config")       -- LSP after treesitter and completion
require("config.luasnip-config")
require("config.telescope-remap")  -- UI tools
require("config.dap-config")       -- Debugging last

-- Setup Mason (should be after LSP config)
require("mason").setup()

-- Mason DAP setup
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
                args = { "-m", "debugpy.adapter" },
            }
            require('mason-nvim-dap').default_setup(config)
        end,
    },
})

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Set colorscheme last
vim.cmd.colorscheme("catppuccin")
