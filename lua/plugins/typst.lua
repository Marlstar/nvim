return {
	{
		"Marlstar/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		opts = {
			dependencies_bin = {
				-- ["tinymist"] = vim.fn.stdpath("data") .. "/mason/bin/tinymist"
			},
			open_cmd = "firefox %s -P typst-preview --class typst-preview",
		},
	}
}
