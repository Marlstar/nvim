return {
	"smjonas/inc-rename.nvim",
	cmd = "IncRename",

	config = function()
		require("inc_rename").setup{

		}
		vim.keymap.set("n", "<leader>rn", ":IncRename ")
		vim.o.inccommand = "split"
	end,
}
