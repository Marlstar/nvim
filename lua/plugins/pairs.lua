return {
	"echasnovski/mini.pairs",
	version = "*",
	opts = { },
	config = function(_, opts)
		require("mini.pairs").setup(opts)
		local map_dollar = function()
			MiniPairs.map_buf(0, "i", "$", {
				action = "closeopen",
				pair = "$$",
				neigh_pattern = "[ \r].",
				register = {cr = true}
			})
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "typst",
			callback = map_dollar
		})
	end,
}
-- return {
-- 	"windwp/nvim-autopairs",
-- 	event = "InsertEnter",
-- 	opts = {},
-- 	config = function(_, opts)
-- 		require("nvim-autopairs").setup(opts)
--
-- 		local Rule = require("nvim-autopairs.rule")
-- 		local conditions = require("nvim-autopairs.conds")
-- 		require("nvim-autopairs").add_rule(
-- 			Rule("$", "$", {"typst", "tex", "latex"})
-- 				:with_pair(conditions.not_before_char("\\", 1))
-- 		)
-- 	end
-- }
