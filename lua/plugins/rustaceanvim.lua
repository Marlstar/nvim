return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	keys = {
		{ "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, ft = "rust" }
	}
}
