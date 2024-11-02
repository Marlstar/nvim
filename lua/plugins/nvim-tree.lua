return {
    "nvim-tree/nvim-tree.lua",
	event = "VeryLazy",

	enabled = false,

    config = function ()
        require("nvim-tree").setup({
            view = {
                width = 30
            }
        })
    end
}
