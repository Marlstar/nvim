local supertab = function(if_active, if_not_active)
	return function(cmp)
		if cmp.snippet_active() then
			vim.notify("hello",0,{})
			if cmp.is_visible() then
				return cmp[if_active]()
			else
				return cmp[if_not_active]()
			end
		end
	end
end

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"disrupted/blink-cmp-conventional-commits",
	},
	version = "1.*",

	opts = {
		sources = {
			default = {
				"lazydev",
				"lsp",
				"path",
				"snippets",
				"buffer",
			},

			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},

				conventional_commits = {
					name = 'Conventional Commits',
					module = 'blink-cmp-conventional-commits',
					enabled = function()
						return vim.bo.filetype == 'gitcommit'
					end,
					opts = {},
				},
			},
		}
	},

	keymap = {
		preset = "none",
		["<Tab>"] = { supertab("select_next", "snippet_backward"), "select_next", "fallback" },
		["<S-Tab>"] = { supertab("select_prev", "snippet_backward"), "select_prev", "fallback" },
		["<CR>"] = { "accept" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-Space>"] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
		['<C-e>'] = { 'hide', 'fallback' },
	},

	completion = {
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			}
		}
	},

	appearance = {
		nerd_font_variant = "normal",
	},
}
-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
--
-- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
-- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
--
-- ["<C-Space>"] = cmp.mapping.complete(),
-- ["<CR>"] = cmp.mapping.confirm({ select = false }),
-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- ["<C-CR>"] = function(fallback)
	-- 	cmp.abort()
	-- 	fallback()
	-- end,
