return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope" },
		opts = {
			mappings = {
				n = {
					["q"] = require("telescope.actions").close
				}
			},

			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown{}
				}
			}
		},
		keys = {
			{ "<leader>ff", require("telescope.builtin").find_files },
			{ "<leader>fg", require("telescope.builtin").live_grep },
			{ "<leader>fz", require("telescope.builtin").current_buffer_fuzzy_find },
			{ "<leader>fd", require("telescope.builtin").diagnostics },
			{ "<leader>fb", require("telescope.builtin").buffers },
			{ "<leader>fh", require("telescope.builtin").highlights },
			{ "<leader>fm", require("telescope.builtin").marks },
		},
		init = function()
			vim.api.nvim_create_user_command(
				"Colorschemes",
				function() require("telescope.builtin").colorscheme() end,
				{ nargs = 0 }
			)
		end
	},

	-- PLUGINS
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end
	}
}
