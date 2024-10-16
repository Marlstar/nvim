require("heirline").load_colors(require("tokyonight.colors.moon"))

local StatusLine = {
	-- Left
	{
		require("statusline.ViMode"),
	},
	-- Middle
	{
		require("statusline.File"),
	},
	-- Right
	{

	}
}
require("heirline").setup({
	statusline = StatusLine
})
