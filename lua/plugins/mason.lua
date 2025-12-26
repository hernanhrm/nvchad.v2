return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP Servers
        "vtsls",
        "html-lsp",
        "css-lsp",
        "gopls",
        "lua-language-server",

        -- Formatters & Linters
        "biome",
        "stylua",
        "goimports",
        "gci",
        "gofmt",
        "golangci-lint",
        "golangci-lint-langserver",

        -- debug
        "delve",
      },
    },
  },
}
