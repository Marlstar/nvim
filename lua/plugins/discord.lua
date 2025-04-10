return {
	"IogaMaster/neocord",
	opts = {
		logo                = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/1200px-Neovim-mark.svg.png",
		logo_tooltip        = nil,                        -- nil or string
		main_image          = "language",                 -- "language" or "logo"
		client_id           = "1157438221865717891",      -- Use your own Discord application client id (not recommended)
		log_level           = nil,
		debounce_timeout    = 10,
		blacklist           = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
		file_assets         = {},
		show_time           = true,
		global_timer        = false, -- if set true, timer won't update when any event are triggered

		-- Rich Presence text options
		editing_text        = "Editing %s",
		file_explorer_text  = "Browsing %s",
		git_commit_text     = "Committing changes",
		plugin_manager_text = "Managing plugins",
		reading_text        = "Reading %s",
		workspace_text      = "Working on %s",
		line_number_text    = "Line %s of %s",
		terminal_text       = "Using Terminal",
	}
}
