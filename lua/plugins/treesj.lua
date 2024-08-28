return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`

	config = function()
		require('treesj').setup({--[[ your config ]]})

		local map = require("map")

		map("n", "<leader>jt", require("treesj").toggle)
		map("n", "<leader>jT", function()
			require("treesj").toggle({split={recursive=true}, join={recursive=true}})
		end)
		map("n", "<leader>js", require("treesj").join)
		map("n", "<leader>jj", require("treesj").split)
	end,
}
