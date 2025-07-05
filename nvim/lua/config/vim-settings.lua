-- Additional vim-like settings and autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank (very vim-like)
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
  end,
})

-- Return to last edit position when opening files
autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line "'\""
    if line > 1 and line <= vim.fn.line "$" and vim.bo.filetype ~= "commit" then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Auto-create directories when saving
autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Remove trailing whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Better vim-like settings
vim.opt.updatetime = 250          -- Faster completion
vim.opt.signcolumn = "yes"        -- Always show signcolumn
vim.opt.splitbelow = true         -- Horizontal splits go below
vim.opt.splitright = true        -- Vertical splits go right
vim.opt.undofile = true          -- Persistent undo
vim.opt.backup = false           -- Don't create backup files
vim.opt.writebackup = false      -- Don't create backup before writing
vim.opt.swapfile = false         -- Don't create swap files

-- Better search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')  -- Clear search highlight with Esc
