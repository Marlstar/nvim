local supertab = function(if_active, if_not_active)
	return function(cmp)
		if cmp.snippet_active() then
			if cmp.is_visible() then
				return cmp[if_active]()
			else
				return cmp[if_not_active]()
			end
		end
	end
end

return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"disrupted/blink-cmp-conventional-commits",

			-- nvim-cmp sources
			"hrsh7th/cmp-calc",
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

					calc = { -- cmp-calc
						name = "calc",
						module = "blink.compat.source",
					},
				},
			},

			keymap = {
				preset = "none",
				["<Tab>"] = { supertab("select_next", "snippet_forward"), "select_next", "fallback" },
				["<S-Tab>"] = { supertab("select_prev", "snippet_backward"), "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
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

			cmdline = {
				enabled = true,
				keymap = {
					preset = "inherit",
					["<Tab>"] = { "show", "select_next", "fallback" },
				},
				completion = {
					menu = {
						auto_show = false,
					},
					ghost_text = { enabled = false },
				},
			},

			appearance = {
				nerd_font_variant = "normal",
			},
		},
	},

	-- nvim-cmp source compat
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	}
}
