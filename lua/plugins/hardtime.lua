return {
    "m4xshen/hardtime.nvim",
	enabled = false,
    dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim"
	},
    opts = {
        restricted_keys = {
            ["h"] = {},
            ["j"] = {},
            ["k"] = {},
            ["l"] = {},
        }
    },
}
