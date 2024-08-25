return {
    -- Plugins
    -- Startup UI
    require("plugins.alpha"),

    -- LSP
    require("plugins.lsp-zero"),

    -- Behaviour
    require("plugins.treesitter"),

    require("plugins.telescope"),
    -- require("plugins.coc"),
    require("plugins.lspkind"),
    require("plugins.nvim-cmp"),
    require("plugins.surround"),
    require("plugins.comment"),

    -- UI
    require("plugins.barbar"),
    require("plugins.lualine"),
    require("plugins.nvim-tree"),
    require("plugins.indent-blankline"),
    require("plugins.todo-comments"),
    require("plugins.hover"),
	require("plugins.screenkey"),
    -- Folding
    -- require("plugins.pretty-fold"),
    require("plugins.markview"),

    -- Practice stuff
    require("plugins.hardtime"),
    require("plugins.vim-be-good"),

    require("plugins.typst-preview"),

	-- Other
	require("plugins.presence"),

    -- Themes
    {"navarasu/onedark.nvim"},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    require("themes.onehalf"),
	require("themes.tokyonight"),
}
