local ensure_installed = {
	"rust_analyzer",
	"lua_ls",
	"tinymist",
}

local default_server_opts = {

}

return {
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall","LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		init = function()
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			-- local lsp_defaults = require("lspconfig").util.default_config

			-- -- Add cmp_nvim_lsp capabilities
			-- lsp_defaults.capabilities = vim.tbl_deep_extend(
			-- 	"force",
			-- 	lsp_defaults.capabilities,
			-- 	require("cmp_nvim_lsp").default_capabilities()
			-- )

			-- Stuff that only works when there is an active LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
					vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				end
			})

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				handlers = {
					-- Handles all lsps
					-- Custom configs are under `lspconfig.SERVER_NAME`
					function(server_name)
						if pcall(require, "lspconfig." .. server_name) then
							require("lspconfig")[server_name].setup(require("lspconfig." .. server_name))
						else
							require("lspconfig")[server_name].setup(default_server_opts)
						end
					end,
				}
			})
		end
	}
}
