return {
	"garymjr/nvim-snippets",
	event = "InsertEnter",
	dependencies = "rafamadriz/friendly-snippets",
	opts = {
		friendly_snippets = true,
		create_cmp_source = true
	},
	keys = {
		{
			"<Tab>",
			function()
				if vim.snippet.active({ direction = 1 }) then
					vim.schedule(function()
						vim.snippet.jump(1)
					end)
					return
				end
				return "<Tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<Tab>",
			function()
				vim.schedule(function()
					vim.snippet.jump(1)
				end)
			end,
			expr = true,
			silent = true,
			mode = "s",
		},
		{
			"<S-Tab>",
			function()
				if vim.snippet.active({ direction = -1 }) then
					vim.schedule(function()
						vim.snippet.jump(-1)
					end)
					return
				end
				return "<S-Tab>"
			end,
			expr = true,
			silent = true,
			mode = { "i", "s" },
		},
	},
}
