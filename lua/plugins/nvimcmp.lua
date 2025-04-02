return {
	"hrsh7th/nvim-cmp",
	enabled = false,
	version = false, -- use newest possible
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
		{ "hrsh7th/cmp-nvim-lsp-document-symbol", event = "CmdlineEnter" },
		"hrsh7th/cmp-calc",

		"zjp-CN/nvim-cmp-lsp-rs", -- Rust-Analyzer filtering and sorting

		"onsails/lspkind.nvim", -- Item icons 
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
				{ name = "snippets" },
				{ name = "path" },
				{ name = "calc" },
			}, {
				{ name = "buffer" },
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end
			},
			experimental = {
				ghost_text = false
			},
			sorting = defaults.sorting,

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			}
		}
	end,
	init = function()
		-- Customization for Pmenu
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
		vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

		vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
		vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

		vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
		vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

		vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
		vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
		vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
		vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
		vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
		vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
		vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
		vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
		vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
	end
}
