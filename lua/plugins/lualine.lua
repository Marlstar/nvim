return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
	},
	opts = {
		options = {
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},	theme = "tokyonight",
		},

		sections = {
			lualine_x = {
				{ "fancy_macro", icon = {
					"󰑊",
					color = { fg = "red" }
				} },
				"lsp_status",
				"filetype",
			},
		},
	}
}
