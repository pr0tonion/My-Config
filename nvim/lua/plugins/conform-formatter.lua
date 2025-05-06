return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					async = true,
					callback = function(success)
						if success then
							vim.notify("Formatting complete!", vim.log.levels.INFO)
						else
							vim.notify("Formatting failed!", vim.log.levels.WARN)
						end
					end,
				})
			end,
			mode = "",
			desc = "Format buffer with Conform",
		},
	},
	opts = {
		-- Define formatters by filetype
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Add a fallback for unsupported filetypes
		fallback_formatters = { "lsp_format" },
		-- Default formatter options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Format on save for specific filetypes
		format_on_save = {
			enable = true,
			timeout_ms = 2000,
		},
		-- Customize individual formatters
		formatters = {
			ruff = {
				prepend_args = { "--line-length=120", "--fix", "--config=pyproject.toml" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
