local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>fF", telescope.extensions.smart_open.smart_open, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "List previously opened files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Colorschemes" })

-- vim.keymap.set("n", "<leader>rf", builtin.quickfix, { desc = "Quickfixes" })

vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Buffers" })

vim.keymap.set("n", "<leader>hf", builtin.git_branches, { desc = "Git branches" })

vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Jumplist" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Registers" })

vim.keymap.set("n", "<leader>fl", builtin.lsp_references, { desc = "lsp references" })
vim.keymap.set("n", "<leader>fp", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fx", builtin.diagnostics, { desc = "diagnostics" })
vim.keymap.set("n", "<leader>fd", builtin.lsp_type_definitions, { desc = "Goto Definition" })
