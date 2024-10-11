return {
    "OXY2DEV/markview.nvim",
	ft = "markdown",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        require("markview").setup {
            hybrid_modes = { "i", "n", "v" },
        }
        vim.cmd("Markview enableAll")
    end
}
