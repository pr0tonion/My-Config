local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K', { desc = "Tab vertical to horizontal" }) -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H', { desc = "Tab Horizontal to vertical" }) -- change horizontal to verticai

-- Tmux/Window navigation (unified approach)
map('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>')
map('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>')
map('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>')
map('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>')

-- Alternative window navigation when not using tmux
-- map('n', '<M-h>', '<C-w>h')  -- Alt+h
-- map('n', '<M-j>', '<C-w>j')  -- Alt+j  
-- map('n', '<M-k>', '<C-w>k')  -- Alt+k
-- map('n', '<M-l>', '<C-w>l')  -- Alt+l
-- Disable arrow keys
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Better vim-like bindings
-- Keep cursor centered when searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor centered when jumping
map('n', '<C-o>', '<C-o>zz')
map('n', '<C-i>', '<C-i>zz')

-- Better indenting in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move lines up/down in visual mode (more vim-like than J/K override)
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Better pasting (don't lose register when pasting over selection)
map('x', '<leader>p', '"_dP')

-- Vim-like movement enhancements (keeping J and K for their original purpose)
-- Use Ctrl+d/u for faster movement instead
map('n', '<C-d>', '10j')  -- Move down 10 lines
map('n', '<C-u>', '10k')  -- Move up 10 lines
-- Note: J joins lines (vim default), K shows help (vim default) - don't override these!

-- File Explorer (more vim-like)
-- Use - for going up directory (like netrw) and <leader>e for toggle
map('n', '<leader>e', ':NvimTreeToggle<CR>') -- More standard than <tab>
map('n', '<leader>E', ':NvimTreeFindFileToggle<CR>') -- Find current file in tree
-- Keep netrw binding as backup
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Formatter
