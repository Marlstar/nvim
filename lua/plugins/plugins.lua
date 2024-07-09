M = {}

function M.plugins ()
    return {
        -- LSP stuff
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},


        -- Theme
        {"navarasu/onedark.nvim"},
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

        -- Plugins
        require("plugins.treesitter"),
        require("plugins.surround"),
        require("plugins.barbar"),
        require("plugins.lualine"),
    }
end

function M.setup_plugins()
    require('plugins.lsp-zero-config')
    require('plugins.lualine.config')
end

return M
