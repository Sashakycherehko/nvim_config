return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Setup capabilities for cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Common on_attach function for keybindings
			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
				map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
				map("n", "<Leader>lr", vim.lsp.buf.rename, "Rename")
				map({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, "Code action")
				map("n", "<Leader>lf", function()
					vim.lsp.buf.format({ async = true })
				end, "Format")

				-- Diagnostics
				vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { buffer = bufnr })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })
				vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { buffer = bufnr })
			end

			-- LSP servers
			local servers = {
				pyright = {
					pythonPath = "$HOME/.python3.13",
				},
				ts_ls = {}, -- заменили устаревший tsserver
				prismals = {},
				clangd = {},
				html = {},
				golangci_lint_ls = {},
				cssls = {
					capabilities = capabilities,
				},
				emmet_ls = {
					filetypes = {
						"html",
						"css",
						"scss",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
					},
				},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							diagnostics = {
								enable = true,
								experimental = {
									enable = true,
								},
							},
						},
					},
				},
			}

			for server, opts in pairs(servers) do
				opts.on_attach = on_attach
				opts.capabilities = opts.capabilities or capabilities
				lspconfig[server].setup(opts)
			end
		end,
	},
}
