local theme_opts = {
	italic_keywords = false,
	italic_comments = true,
}
return {
	{ -- tokyonight
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			keywords = { italic = theme_opts.italic_keywords },
			comments = { italic = theme_opts.italic_comments },
		},
	},
	{ -- catppuccin
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		"darianmorat/gruvdark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
}
