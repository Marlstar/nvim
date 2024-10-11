return {
	'chomosuke/typst-preview.nvim',
	version = '0.3.*',
	build = function() require 'typst-preview'.update() end,
	ft = "typst"
}
