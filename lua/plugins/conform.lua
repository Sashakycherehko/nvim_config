return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "black_custom" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			typescript = { "prettierd", stop_after_first = true },
			javascript = { "prettierd", stop_after_first = true },

			c = { "clang-format" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters = {
			black_custom = {
				command = "/home/alex/.local/bin/black",
				args = { "--quiet", "-" },
				stdin = true,
			},
		},
	},
}
