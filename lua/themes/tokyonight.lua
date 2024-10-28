local on_highlights = function(hl, c)
	local prompt = "#2d3149"
	hl.TelescopeNormal = {
		bg = c.bg_dark,
		fg = c.fg_dark,
	}
	hl.TelescopeBorder = {
		bg = c.bg_dark,
		fg = c.bg_dark,
	}
	hl.TelescopePromptNormal = {
		bg = prompt,
	}
	hl.TelescopePromptBorder = {
		bg = prompt,
		fg = prompt,
	}
	hl.TelescopePromptTitle = {
		bg = prompt,
		fg = prompt,
	}
	hl.TelescopePreviewTitle = {
		bg = c.bg_dark,
		fg = c.bg_dark,
	}
	hl.TelescopeResultsTitle = {
		bg = c.bg_dark,
		fg = c.bg_dark,
	}
end

return {
	"folke/tokyonight.nvim",
	lazy = true,
	priority = 1000,
	opts = {
		style = "moon",
		transparent = not vim.g.neovide,
		on_highlights = on_highlights,
	},
}
