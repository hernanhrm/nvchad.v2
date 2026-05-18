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
        "json-lsp",
        "pyright",
        "svelte-language-server",
        "rust-analyzer",

        -- Formatters & Linters
        "biome",
        "prettier",
        "stylua",
        "goimports",
        "gci",
        "gofmt",
        "golangci-lint",
        "golangci-lint-langserver",
        "ruff",

        -- debug
        "delve",
        "dart-debug-adapter",
        "codelldb",
      },
    },
  },
}
