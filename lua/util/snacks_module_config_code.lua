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
