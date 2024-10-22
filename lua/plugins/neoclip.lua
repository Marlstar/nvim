return {
	"AckslD/nvim-neoclip.lua",
	event = "VeryLazy",

	dependencies = {
		{'kkharji/sqlite.lua', module = 'sqlite'},
		-- you'll need at least one of these
		{'nvim-telescope/telescope.nvim'},
		-- {'ibhagwan/fzf-lua'},
	},
	config = function()
		require('neoclip').setup({
			history = 100,
			enable_persistent_history = true,
			default_register = "0",
		})
	end,
}
