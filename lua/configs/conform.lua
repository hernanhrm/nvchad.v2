local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gci" },

    -- Biome para JavaScript/TypeScript/React
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },

    -- Biome también soporta CSS/HTML
    css = { "biome" },
    html = { "biome" },

    -- Ruff para Python (linter + formatter)
    python = { "ruff_format", "ruff_organize_imports" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
