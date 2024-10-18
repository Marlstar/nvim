local M = {}

---@type fun(name: string): vim.api.keyset.hl_info
function M.get_hl(name)
    return vim.api.nvim_get_hl(0, { name = name, link = false })
end

return M
