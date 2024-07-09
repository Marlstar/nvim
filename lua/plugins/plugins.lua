return {
    -- LSP stuff
    require("plugins.lsp-zero"),

    -- Theme
    {"navarasu/onedark.nvim"},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Plugins
    require("plugins.treesitter"),
    require("plugins.surround"),
    require("plugins.barbar"),
    require("plugins.lualine"),
    require("plugins.nvim-cmp"),
    --require("plugins.nvim-cmp-snippy"),
}
