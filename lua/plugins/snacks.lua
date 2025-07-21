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

		-- Better image.nvim
		image = {
			enabled = true,
			math = {
				enabled = false,
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

		-- Telescope, but better
		picker = {
			enabled = true,
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
		-- MOVED TO PICKER | { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show notification history" },
		{ "<leader>nc", function() Snacks.notifier.hide() end, desc = "Hide notifications" },

		-- LazyGit
		{ "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open LazyGit" },

		-- Picker
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Picker - files" },
		{ "<leader>fz", function() Snacks.picker.zoxide() end, desc = "Picker - directories (zoxide)" },
		{ "<leader>fr", function() Snacks.picker.files() end, desc = "Picker - recent files" },

		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Picker - grep" },
		{ "<leader>fG", function() Snacks.picker.grep_word() end, desc = "Picker - grep current word" },
		{ "<leader>fl", function() Snacks.picker.lines() end, desc = "Picker - lines (buffer)" },
		{ "<leader>fh", function() Snacks.picker.search_history() end, desc = "Picker - search history" },

		-- TODO: move lsp keybinds into picker
		-- { "<leader>fl", Snacks.picker.lsp_references, desc = "Picker - LSP references" },

		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Picker - buffers" },
		{ "<leader>fm", function() Snacks.picker.marks() end, desc = "Picker - marks" },
		{ "<leader>fr", function() Snacks.picker.registers() end, desc = "Picker - registers" },
		{ "<leader>fu", function() Snacks.picker.undo() end, desc = "Picker - undo tree" },

		{ "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Picker - diagnostics" },
		{ "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Picker - diagnostics (buffer)" },
		{ "<leader>fq", function() Snacks.picker.qflist() end, desc = "Picker - quickfix" },
		{ "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Picker - lsp symbols" },
		{ "<leader>nh", function() Snacks.picker.notifications() end, desc = "Picker - notification history" },

		-- Misc
		{ "<leader>fh", function() Snacks.picker.highlights() end, desc = "Picker - highlights" },
		{ "<leader>fi", function() Snacks.picker.icons() end, desc = "Picker - Nerd Font Icons" },

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

		--------------
		--  Picker  --
		--------------
		vim.api.nvim_create_user_command(
			"Picker",
			function(opts)
				Snacks.picker[opts.fargs[1]]()
			end,
			{
				nargs = 1,
				complete = function(ArgLead, CmdLine, CursorPos)
					local picker = Snacks.picker
					local sources = {}
					for source, _ in pairs(picker) do
						table.insert(sources, source)
					end
					return sources
				end
			}
		)
		vim.api.nvim_create_user_command(
			"Colorschemes",
			function() Snacks.picker.colorschemes() end,
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

		--------------
		--   Term   --
		--------------
		vim.env.INSIDE_NEOVIM_FISH = 1
	end
}
