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
				["tinymist"] = vim.fn.stdpath("data") .. "/mason/bin/tinymist"
			}
		},

		config = function(_, opts)
			vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
				pattern = { "*.typ" },
				callback = function()
					-- vim.cmd("set sw=4")
					-- vim.cmd("set tw=4")
					require("vimrc")
				end,
				desc = "Reset tw and sw when entering typst files"
			})
		end,

	}
}
