return {
	"nat-418/boole.nvim",
	keys = { "<C-S-A>", "<C-S-X>" },
	config = function ()
		require("boole").setup({
			mappings = {
				increment = "<C-S-A>",
				decrement = "<C-S-X>",
			}
		})
	end
}
