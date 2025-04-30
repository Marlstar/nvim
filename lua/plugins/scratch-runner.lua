return {
	"DestopLine/scratch-runner.nvim",
	opts = {
		sources = {
			rust = {
				function(file_path, bin_path)
					return { "rustc", file_path, "-o", bin_path }
				end,
				extension = "rs",
				binary = true,
			},
		},
	}
}
