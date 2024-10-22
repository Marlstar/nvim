local ensure_installed = {
	"c",
	"cpp",
	"diff",
	"lua",
	"luadoc",
	"vim",
	"vimdoc",
	"query",
	"html",
	"rust",
	"toml",
	"python",
	"typst",
	"bibtex",
	"java",
	"json",
	"comment",
}

return {
    "nvim-treesitter/nvim-treesitter",
    build=":TSUpdate",
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0, -- Load early if loading a file from the command-line
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,

    config=function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
			ensure_installed = ensure_installed,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
