local M = {
	"NTBBloodbath/galaxyline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons"
}

M.config = function ()
	local gl = require("galaxyline")
	local gls = gl.section
	local colour = require("galaxyline.themes.colors")
	local components = require("statusline.components")

	gls.left[1] = require("statusline.components.mode")
end

return M
