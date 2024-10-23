-- Features that only work if there is an active LSP
local lsp_attach = function (event)
    local opts = {buffer = event.buf}
	local map = require("map")
    -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

local ensure_installed_lsps = {
	"rust_analyzer",
	"lua_ls",
	"typst_lsp",
	"jdtls",
}

local M = {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		lazy = true,
		config = false,
	},
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = {}
	},
	{
		'neovim/nvim-lspconfig',
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ 'williamboman/mason-lspconfig.nvim' },
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
		},
		init = function ()
			vim.opt.signcolumn = 'yes'
		end,

		config = function ()
			local lsp_defaults = require("lspconfig").util.default_config

			-- Add cmp_nvim_lsp capabilities to lspconfig
			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- Put features here that only work if there is an active LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = lsp_attach
			})

			-- Set up LSPs
			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed_lsps,
				handlers = {
					-- Default LSP setup
					function(server_name)
						require("lspconfig")[server_name].setup({
							root_dir = function(fname) return vim.fn.getcwd() end,
						})
					end,

					-- Manually-configured LSPs
					lua_ls = function() require("lsp.lua_ls") end,
					tinymist = function() require("lsp.tinymist") end,
					harper_ls = function() require("lsp.harper-ls") end,
					typst_lsp = function() require("lsp.typst-lsp") end,
					jdtls = function() --[[noop]] end,
				},
			})
		end
	},
}

return M
