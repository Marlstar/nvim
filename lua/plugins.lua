return {
    -- Startup UI
    require("plugins.alpha"),

    -- LSP
    require("plugins.lsp-zero"),

    -- Behaviour
    require("plugins.treesitter"),

	-- UI and functionality
    require("plugins.telescope"),
	-- Autocomplete menu
    require("plugins.nvim-cmp"),
    require("plugins.lspkind"),

	-- Functionality
    require("plugins.surround"),
    require("plugins.comment"),
	require("plugins.boole"),

    -- UI
    require("plugins.barbar"), -- Tabs
    require("plugins.lualine"), -- Status line
    require("plugins.nvim-tree"), -- File tree
    require("plugins.indent-blankline"), -- Indent guides
    require("plugins.todo-comments"), -- TODO highlights
    require("plugins.hover"), -- LSP and diagnostic info on hover
	require("plugins.screenkey"), -- Screenkeys overlay
	require("plugins.notify"), -- Pretty, customisable notifications
    -- require("plugins.pretty-fold"),

	-- Editing
    require("plugins.markview"), -- Live markdown previewing
    require("plugins.typst-preview"), -- Live typst previewing

    -- Practice stuff
    require("plugins.hardtime"), -- Force good habits
    require("plugins.vim-be-good"), -- Practice motions and actions

	-- Other
	require("plugins.presence"), -- Discord rich presence

    -- Themes
	require("plugins.themery"), -- Theme selector
	require("themes.onedark"),
	require("themes.catppuccin"),
	require("themes.tokyonight"),
	require("themes.flow"),
}
