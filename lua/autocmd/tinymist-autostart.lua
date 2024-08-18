vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.typ",
    callback = function()
        vim.api.nvim_buf_set_option(
            vim.api.nvim_get_current_buf(),
            "filetype", "typst"
        )
    end,
})
