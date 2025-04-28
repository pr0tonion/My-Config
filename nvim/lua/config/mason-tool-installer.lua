require("mason-tool-installer").setup({
	ensure_installed = {
		-- Formatters
		"prettier",
		"prettierd",
		"black",
		"isort",
		"stylua",
	},
	auto_update = true,
	run_on_start = true,
})
