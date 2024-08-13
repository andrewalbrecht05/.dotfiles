return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "bashls", "clangd", "cssls", "html", "jsonls", "tsserver", "lua_ls",
				"markdown_oxide", "pylyzer", "rust_analyzer", "sqlls", "taplo", "yamlls" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.html.setup({
				capabilities = capabilities
			})
			lspconfig.clangd.setup({capabilities = capabilities})
			lspconfig.rust_analyzer.setup({capabilities = capabilities})
			lspconfig.tsserver.setup({capabilities = capabilities})
			lspconfig.pylyzer.setup({capabilities = capabilities})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<F4>', vim.lsp.buf.definition, {})
			vim.keymap.set({'n', 'v'}, 'F', vim.lsp.buf.code_action, {})
		end
	}
}
