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
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show notification history" },
		{ "<leader>nc", function() Snacks.notifier.hide() end, desc = "Hide notifications" },

		-- LazyGit
		{ "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open LazyGit" },

		-- Picker
		{ "<leader>ff", Snacks.picker.files, desc = "Picker - files" },
		{ "<leader>fz", Snacks.picker.zoxide, desc = "Picker - directories (zoxide)" },
		{ "<leader>fr", Snacks.picker.files, desc = "Picker - recent files" },

		{ "<leader>fg", Snacks.picker.grep, desc = "Picker - grep" },
		{ "<leader>fG", Snacks.picker.grep_word, desc = "Picker - grep current word" },
		{ "<leader>fl", Snacks.picker.lines, desc = "Picker - lines (buffer)" },
		{ "<leader>fh", Snacks.picker.search_history, desc = "Picker - search history" },

		-- TODO: move lsp keybinds into picker
		-- { "<leader>fl", Snacks.picker.lsp_references, desc = "Picker - LSP references" },

		-- TODO: use picker notifications instead of <leader>nh
		{ "<leader>fb", Snacks.picker.buffers, desc = "Picker - buffers" },
		{ "<leader>fm", Snacks.picker.marks, desc = "Picker - marks" },
		{ "<leader>fr", Snacks.picker.registers, desc = "Picker - registers" },
		{ "<leader>fu", Snacks.picker.undo, desc = "Picker - undo tree" },

		{ "<leader>fd", Snacks.picker.diagnostics, desc = "Picker - diagnostics" },
		{ "<leader>fD", Snacks.picker.diagnostics_buffer, desc = "Picker - diagnostics (buffer)" },
		{ "<leader>fq", Snacks.picker.qflist, desc = "Picker - quickfix" },

		-- Misc
		{ "<leader>fh", Snacks.picker.highlights, desc = "Picker - highlights" },
		{ "<leader>fi", Snacks.picker.icons, desc = "Picker - Nerd Font Icons" },

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
	end
}
