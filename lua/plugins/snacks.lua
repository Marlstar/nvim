-- Code to do stuff for certain modules
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
		-- Home dashboard
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "S", desc = "Sessions", action = ":Sessions" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				}
			},
			sections = {
				{
					section = "terminal",
					cmd = "cat " .. vim.fn.stdpath("config") .. "/resources/dash.txt",
					height = 17,
					padding = 1,
					-- remove the image if it takes up too much space
					enabled = function () return vim.api.nvim_win_get_height(0) >= 37 end
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},

		-- Pretty notifications
		notifier = {
			enabled = true,
			-- see config code
		},

		-- Git utilities
		git = {
			-- see config code
		},

		-- Git browse - show code in github/bitbucket/etc
		gitbrowse = {
			-- see config code
		},

		-- Indent lines
		indent = {
			enabled = true,
			indent = {
				char = "▎",
			},
			scope = {
				char = "▎",
			},
			animate = {
				enabled = false,
			},
		},

		-- Nicer vim.input
		input = {
			enabled = true,
		},

		-- Lazygit integrated into neovim
		lazygit = {
			enabled = true
			-- see config code
		},

		-- When opening from terminal, show files before loading plugins
		quickfile = {
			enabled = true,
		},

		-- LSP file renaming
		rename = {
			-- see config code
		},

		-- Scratch buffers
		scratch = {
			enabled = true,
		},

		-- Scope
		scope = {
			enabled = true
		},

		-- Smooth scroll
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 15, total = 150 }
			},
		},

		-- Status column
		statuscolumn = {
			enabled = true,
		},

		-- Terminal
		terminal = {
			keys = {
				{ "<C-\\>", function() Snacks.terminal.toggle(nil, {win={position="float"}}) end},
			}
		},

		-- Toggle
		toggle = {
			which_key = true,
			notify = true,
		}
	},

	keys = {
		-- BufDelete
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
		{ "<leader>x", function() Snacks.bufdelete() end, desc = "Delete buffer" },
		-- Notifier
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show notification history" },
		{ "<leader>nc", function() Snacks.notifier.hide() end, desc = "Hide notifications" },
		-- LazyGit
		{ "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open LazyGit" },
		-- Scratch
		{ "<leader>sn", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
		{ "<leader>ss", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
		-- Terminal
		{ "<C-\\>", function() Snacks.terminal.toggle(nil, {win={position="float"}}) end, mode = {"n","t"}, desc = "Toggle popup terminal" },
	},

	init = function()
		----------------
		--    Dash    --
		----------------
		vim.api.nvim_create_user_command(
			"Dash",
			function() Snacks.dashboard.open() end,
			{ nargs = 0 }
		)

		----------------
		--  Notifier  --
		----------------
		vim.api.nvim_create_user_command(
			"NotificationHistory",
			function() Snacks.notifier.show_history() end,
			{ nargs = 0 }
		)

		-- LSP progress notifications
		require("util.lsp_progress_notification")

		---------------
		--    Git    --
		---------------
		vim.api.nvim_create_user_command(
			"GitBlame",
			function() Snacks.git.blame_line() end,
			{ nargs = 0 }
		)

		-----------------
		--  GitBrowse  --
		-----------------
		vim.api.nvim_create_user_command(
			"GitBrowse",
			function() Snacks.gitbrowse() end,
			{ nargs = 0 }
		)

		---------------
		--  LazyGit  --
		---------------
		vim.api.nvim_create_user_command(
			"LazyGit",
			function() Snacks.lazygit.open() end,
			{ nargs = 0 }
		)

		----------------
		--   Rename   --
		----------------
		vim.api.nvim_create_user_command(
			"RenameFile",
			function() Snacks.rename.rename_file() end,
			{ nargs = 0 }
		)
	end
}
