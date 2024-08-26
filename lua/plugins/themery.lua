return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				{ name = "One Dark", colorscheme = "onedark" },

				{ name = "Tokyo Night Moon", colorscheme = "tokyonight-moon" },
				{ name = "Tokyo Night Storm", colorscheme = "tokyonight-storm" },
				{ name = "Tokyo Night", colorscheme = "tokyonight-night" },

				{ name = "Catpuccin Mocha", colorscheme = "catppuccin-mocha" },
				{ name = "Flow", colorscheme = "flow" },
			},
		})
	end
}
