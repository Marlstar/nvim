return {
	"mrcjkb/rustaceanvim",
	-- TODO: update to v6 once nvim is updated to 0.11
	version = "^5",
	lazy = false,
	keys = {
		{ "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, ft = "rust" }
	}
}
