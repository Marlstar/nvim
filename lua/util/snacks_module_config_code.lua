----------------
--  Notifier  --
----------------

-- :NotificationHistory
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
