require("heirline").load_colors(require("tokyonight.colors.moon"))
local Align = { provider = "%=" }

local StatusLine = {
	-- Left
	{
		require("statusline.ViMode"),
		require("statusline.File"),
		require("statusline.Git"),
		Align
	},
	-- Middle
	{
		require("statusline.Diagnostics"),
	},
	-- Right
	{
		Align,
		require("statusline.Ruler")
	}
}
require("heirline").setup({
	statusline = StatusLine
})
