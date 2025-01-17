return {
	"hrsh7th/nvim-cmp",
	version = false, -- use newest possible
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
		{ "hrsh7th/cmp-nvim-lsp-document-symbol", event = "CmdlineEnter" },
		"hrsh7th/cmp-calc",

		"zjp-CN/nvim-cmp-lsp-rs" -- Rust-Analyzer filtering and sorting
	},
	config = function(_, opts)
		local cmp = require("cmp")
		
		cmp.setup(opts)

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources(
			{ { name = 'path' } },
			{
				{
					name = 'cmdline',
					option = {
						ignore_cmds = { 'Man', '!' }
					}
				}
			})
		})

		require'cmp'.setup.cmdline('/', {
			sources = cmp.config.sources({
				{ name = 'nvim_lsp_document_symbol' }
			}, {
				{ name = 'buffer' }
			})
		})
	end,
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local auto_select = false

		return {
			completion = {
				completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
			},
			preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),

				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),
			-- "hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
			-- { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
			-- { "hrsh7th/cmp-nvim-lsp-document-symbol", event = "CmdlineEnter" },
			-- "hrsh7th/cmp-calc",
			--
			-- "zjp-CN/nvim-cmp-lsp-rs" -- Rust-Analyzer filtering and sorting
			sources = cmp.config.sources({
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "calc" },
			}, {
				{ name = "buffer" },
			}),
			experimental = {
				ghost_text = true
			},
			sorting = defaults.sorting,
		}
	end,
}
