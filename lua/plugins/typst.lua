return {
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "*.typ" },
				callback = function()
					vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", {silent=true})
					vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", {silent=true})
				end,
				desc = "Go down softwrapped lines in typst files"
			})
		end
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
		end,
	}
}
