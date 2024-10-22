return {
	"CRAG666/code_runner.nvim",

	config = function()
		require("code_runner").setup({
			mode = "float",
			float = {
				border = "rounded"
			},
			filetype = {
				typst = function()
					vim.cmd("TypstPreview")
				end,

				rust = "cargo run"
			}
		})
	end
}
