return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = {
		editor = {
			tooltip = "neovim"
		},
		display = {
			theme = "atom",
			flavor = "accent",
		},
		text = {
			file_browser = "Browsing ${name}",
			plugin_manager = "Managing plugins",
			lsp = "Configuring LSPs",
			vcs = "Committing changes",
			terminal = "Terminal"
		},
		variables = true,
		buttons = {
			{ -- Repository if available, github if not
				label = function(opts) return opts.repo_url and "Repository" or "Github" end,
				url = function(opts) return opts.repo_url or "https://github.com/Marlstar" end,
			}
		},
		plugins = {
			["cord.plugins.visibility"] = {
				rules = {
					blacklist = {},
					whitelist = {},
				},
			},
		},
	},
	-- Setting up custom filetypes so that cord can see them
	init = function()
		vim.filetype.add({
			pattern = {
				[".*/hypr/.*%.conf"] = "hyprlang",
			}
		})
	end,
}
