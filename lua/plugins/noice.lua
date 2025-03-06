return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		lsp = {
			-- Override markdown rendering so that cmp and other plugins use Treesitter
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			}
		},

		presets = {
			bottom_search = true, -- Keep search cmdline at the bottom
			command_palette = true, -- Position the cmdline and popupmenu together
			long_message_to_split = true, -- Send long messages to a split
			inc_rename = true, -- inc-rename.nvim input dialog
			lsp_doc_border = false,
		}
	},
}
