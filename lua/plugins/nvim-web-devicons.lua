return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup{
			override = {
				typ = {
					icon = "",
					color = "#469dad",
					name = "Typst"
				},
				typst = {
					icon = "",
					color = "#469dad",
					name = "Typst"
				}
			}
		}
	end
}
