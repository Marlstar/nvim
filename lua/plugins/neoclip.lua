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

		-- Sneaky way to check if running in windows
		if package.config:sub(1,1) == "\\" then
			vim.g.sqlite_clib_path = "C:/users/marle/sqlite_dll/sqlite3.dll"
		end
	end,
}
