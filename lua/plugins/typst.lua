return {
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false
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

		config = function(_, opts)
			require("typst-preview").setup(opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "*.typ" },
				callback = function()
					vim.cmd("set sw=4")
					vim.cmd("set tw=4")
				end,
				desc = "Reset tw and sw when entering typst files"
			})
		end,

	}
}
