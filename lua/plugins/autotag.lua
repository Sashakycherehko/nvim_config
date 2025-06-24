return {
	"windwp/nvim-ts-autotag",
	config = function()
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = { spacing = 5, severity_limit = "Warning" },
			update_in_insert = true,
		})
		opts = {
			-- Defaults
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = true, -- Auto close on trailing </
		}

		per_filetype = {
			["html"] = {
				enable_close = true,
			},
		}
	end,
}
