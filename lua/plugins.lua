return {
    require("plugins.alpha"), -- Startup UI
    require("plugins.lsp-zero"), -- LSP
    require("plugins.treesitter"), -- Core dependency for many plugins

	-- Functionality
    require("plugins.surround"), -- Surround functionality
    require("plugins.comment"), -- Comment lines, similar to the Ctrl+Comma in an IDE
	require("plugins.boole"), -- Toggle booleans etc
    -- require("plugins.pretty-fold"),
	require("plugins.ufo"), -- Indent-based folds
	require("plugins.inc-rename"), -- LSP renaming
	require("plugins.autopairs"), -- Bracket autopairs
	require("plugins.neoclip"), -- Recent yanks

	-- UI
    require("plugins.nvim-cmp"), -- Autocompletion menu
    require("plugins.lspkind"), -- Icons for nvim-cmp

    require("plugins.telescope"), -- UI and base plugin
    require("plugins.barbar"), -- Tabs
    require("plugins.lualine"), -- Status line
    require("plugins.nvim-tree"), -- File tree
    require("plugins.indent-blankline"), -- Indent guides
    require("plugins.todo-comments"), -- TODO highlights
    require("plugins.hover"), -- LSP and diagnostic info on hover
	require("plugins.screenkey"), -- Screenkeys overlay
	require("plugins.notify"), -- Pretty, customisable notifications

	-- Miscellaneous
	require("plugins.presence"), -- Discord rich presence

	-- Editing
    require("plugins.markview"), -- Live markdown previewing
    require("plugins.typst-preview"), -- Live typst previewing

    -- Practice stuff
    require("plugins.hardtime"), -- Force good habits
    require("plugins.vim-be-good"), -- Practice motions and actions

    -- Themes
	require("themes"),
}
