require("lspconfig").pyright.setup{
    settings = {
        python = {
            analysis = {
                semanticTokens = true
            }
        }
    }
}
