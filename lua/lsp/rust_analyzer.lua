local lsp = require("lsp.setup")

lsp.lsp.rust_analyzer.setup{
    capabilities = lsp.capabilities,
    settings = {
        ["rust-analyzer"] = {
            highlight = {
                enabled = true
            }
        }
    }
}
