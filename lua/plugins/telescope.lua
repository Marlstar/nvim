return {
    {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
		lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    require("plugins.telescope.file-browser"),
}
