return {
	"nat-418/boole.nvim",
	config = function ()
		require("boole").setup({
			mappings = {
				increment = "<C-S-A>",
				decrement = "<C-S-X>",
			}
		})
	end
}
