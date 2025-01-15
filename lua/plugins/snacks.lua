return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    ---@type snacks.Config
    opts = {
		-- Home dashboard
		dashboard = {
			sections = {
				{
					section = "terminal",
					cmd = "cat " .. vim.fn.stdpath("config") .. "/resources/dash.txt",
					height = 17,
					padding = 1,
					-- remove the image if it takes up too much space
					enabled = function () return vim.api.nvim_win_get_height(0) >= 35 end
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		-- Pretty notifications
		notifier = {
			enabled = true,
			config = function()
				-- :NotificationHistory
				vim.api.nvim_create_user_command(
					"NotificationHistory",
					function() Snacks.notifier.show_history() end,
					{ nargs = 0 }
				)

				-- LSP progress notifications
				require("util.lsp_progress_notification")
			end
		},
	},

	keys = {
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
	}
}
