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
}
