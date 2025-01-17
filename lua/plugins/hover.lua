return {
	"lewis6991/hover.nvim",
	opts = {
		init = function()
			require("hover.providers.lsp")
			require("hover.providers.diagnostic")
			require("hover.providers.fold_preview")
		end,

		preview_opts = {
			border = "rounded"
		}
	},
	keys = {
		{ "K", function() require("hover").hover() end, desc = "hover.nvim" },
		{ "gK", function() require("hover").hover_select() end, desc = "hover.nvim (select)" },
		{ "<C-p>", function() require("hover").hover_switch("previous") end, desc = "hover.nvim (previous source)" },
		{ "<C-n>", function() require("hover").hover_switch("next") end, desc = "hover.nvim (next source)" },
		{ "<ESC>", function() require("hover").close(0); require("mappings").esc() end, desc = "hover.nvim (close)", noremap = false },
	}
}
