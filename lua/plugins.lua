return {
    -- Plugins

    -- LSP
    require("plugins.lsp-zero"),

    -- Behaviour
    require("plugins.treesitter"),
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
    -- Folding
    -- require("plugins.pretty-fold"),

    -- Practice stuff
    require("plugins.hardtime"),
    require("plugins.vim-be-good"),

    require("plugins.typst-preview"),


    -- Themes
    {"navarasu/onedark.nvim"},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    require("themes.onehalf")
}
