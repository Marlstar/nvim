return {
    -- Themes
	require("themes"),

    require("plugins.alpha"), -- Startup UI
    require("plugins.lsp-zero"), -- LSP
	require("plugins.lazydev"), -- Lua LSP optimisation
	require("plugins.dap"), -- Debugging
    require("plugins.treesitter"), -- Core dependency for many plugins
	require("plugins.nvim-web-devicons"), -- Icons

	-- Language-specific
	require("plugins.lang.rust"),

	-- Git
	require("plugins.gitsigns"),

	-- Functionality
    require("plugins.surround"), -- Surround functionality
    require("plugins.comment"), -- Comment lines, similar to the Ctrl+Comma in an IDE
	require("plugins.boole"), -- Toggle booleans etc
	require("plugins.ufo"), -- Indent-based folds
	require("plugins.inc-rename"), -- LSP renaming
	require("plugins.autopairs"), -- Bracket autopairs
	require("plugins.neoclip"), -- Recent yanks
	require("plugins.treesj"), -- Smart splitting and joining

	-- Commands
	require("plugins.zoxide"), -- Alternative cd using zoxide

	-- UI
    require("plugins.nvim-cmp"), -- Autocompletion menu
    require("plugins.lspkind"), -- Icons for nvim-cmp

    require("plugins.telescope"), -- UI and base plugin
    require("plugins.barbar"), -- Tabs
    -- require("plugins.lualine"), -- Status line
    require("plugins.heirline"), -- Status line
    require("plugins.nvim-tree"), -- File tree
    require("plugins.indent-blankline"), -- Indent guides
    require("plugins.todo-comments"), -- TODO highlights
    require("plugins.hover"), -- LSP and diagnostic info on hover
	require("plugins.showkeys"), -- Screenkeys overlay
	require("plugins.notify"), -- Pretty, customisable notifications
	require("plugins.toggleterm"), -- Alternative terminal option
	require("plugins.here-term"), -- Terminal in the current buffer
	require("plugins.twilight"), -- Dimming of unfocused code sections

	-- Miscellaneous
	require("plugins.presence"), -- Discord rich presence
	require("plugins.leetcode"), -- Write and submit leetcode problems within neovim
	require("plugins.speedtyper"), -- Monkeytype-style typing practice

	-- Editing
    require("plugins.markview"), -- Live markdown previewing
    require("plugins.typst-preview"), -- Live typst previewing

    -- Practice stuff
    require("plugins.hardtime"), -- Force good habits
    require("plugins.vim-be-good"), -- Practice motions and actions

	-- Games
	require("plugins.tetris"),
}
