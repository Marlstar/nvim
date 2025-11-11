return {
	"paradoxical-dev/restoration.nvim",
	event = "VeryLazy",
	opts = {
		-- overwrite current session on exit
		auto_save = true,
		notify = true,
		-- extra aspects of the user session to preserve
		preserve = {
			breakpoints = false, -- requires dap-utils.nvim
			qflist = false, -- requires quickfix.nvim
			undo = false,
			watches = false, -- requires dap-utils.nvim
		},
		branch_scope = true, -- store per branch sessions for git repos
		-- detects and adds venv to vim.env,PATH before loading session
		restore_venv = {
			enabled = true,
			patterns = { "venv", ".venv" }, -- patterns to match against for venv
		},
		picker = {
			default = "snacks", -- vim|snacks
			snacks = {
				-- can be any snacks preset layout or custom layout table
				-- see https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#%EF%B8%8F-layouts
				layout = "select",
				icons = {
					project = "",
					session = "󰑏",
					branch = "",
				},
				hl = {
					base_dir = "SnacksPickerDir",
					project_dir = "Directory",
					session = "SnacksPickerBold",
					branch = "SnacksPickerGitBranch",
				},
			},
		},
	},
	keys = {
		{ "<leader>sf", function() require("restoration").select() end, desc = "Session: Select" },
		{ "<leader>sc", function() require("restoration").select({ cwd = true }) end, desc = "Session: Current CWD" },
		{ "<leader>ss", function() require("restoration").save(true) end, desc = "Session: Save" },
		{ "<leader>sl", function() require("restoration").load({ latest = true }) end, desc = "Session: Load latest" },
		{ "<leader>sd", function() require("restoration").delete() end, desc = "Session: Delete" },
		{ "<leader>sD", function() require("restoration").delete_project() end, desc = "Session: Delete project" },
	},
}
