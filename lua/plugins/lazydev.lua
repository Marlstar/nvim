return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = vim.fn.stdpath("data") .. "/lazy/snacks.nvim", words = { "Snacks" } },
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			}
		}
	},
	{ -- cmp completion
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
}
