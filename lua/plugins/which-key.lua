return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 1000,

		win = {
			wo = {
				-- Transparency
				-- winblend = 50
			}
		}
	},
	keys = {
		{
			"<leader>?",
			function() require("which-key").show({ global = false }) end,
			desc = "Buffer Local Keymaps (which-key)"
		}
	}
}
