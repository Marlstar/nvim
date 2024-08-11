local lsp = require("lsp.setup")

lsp.lsp.pyright.setup{
    capabilities = lsp.capabilities,
    settings = {
        python = {
            analysis = {
                semanticTokens = true
            }
        }
    }
}
