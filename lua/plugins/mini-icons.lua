return {
	"nvim-mini/mini.icons",
	lazy = true,
	opts = {
		filetype = {
			typst = { glyph  = "", hl = { fg = "#469dad" } }
		}
	},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end
}
