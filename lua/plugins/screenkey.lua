return {
    "NStefan002/screenkey.nvim",
    lazy = false,
	config = function ()
		local sk = require("screenkey")
		sk.setup({
			win_opts = {
				height = 1,
				width = 20,
				border = "rounded",
			}
		})
		if sk.is_active() then vim.cmd("Screenkey toggle") end
	end
}
