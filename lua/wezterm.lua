local set_user_var = require("util.set_user_var")

-- Tell wezterm that we are in neovim
set_user_var("IS_NVIM", "true")
vim.api.nvim_create_autocmd("VimLeavePre", {
	desc = "Tell wezterm nvim has been exited",
	callback = function() set_user_var("IS_NVIM","false") end
})
