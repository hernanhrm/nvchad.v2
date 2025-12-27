require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gopls", "vtsls", "jsonls", "pyright" }
vim.lsp.enable(servers)

-- Configuración especial para vtsls (TypeScript/React)
vim.lsp.config.vtsls = {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
  },
}

-- Configuración especial para jsonls (JSON/JSONC)
vim.lsp.config.jsonls = {
  settings = {
    json = {
      -- Habilitar comentarios en archivos JSON
      validate = { enable = true },
      -- Schemas comunes para autocompletado y validación
      schemas = {
        {
          description = "TypeScript compiler configuration file",
          fileMatch = {
            "tsconfig.json",
            "tsconfig.*.json",
          },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          description = "Lerna config",
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json",
        },
        {
          description = "Babel configuration",
          fileMatch = {
            ".babelrc.json",
            ".babelrc",
            "babel.config.json",
          },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          description = "ESLint config",
          fileMatch = {
            ".eslintrc.json",
            ".eslintrc",
          },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          description = "Prettier config",
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
          },
          url = "https://json.schemastore.org/prettierrc",
        },
        {
          description = "Vercel Now config",
          fileMatch = { "now.json" },
          url = "https://json.schemastore.org/now.json",
        },
        {
          description = "NPM configuration file",
          fileMatch = {
            "package.json",
          },
          url = "https://json.schemastore.org/package.json",
        },
        {
          description = "VSCode settings",
          fileMatch = {
            "settings.json",
          },
          url = "https://json.schemastore.org/vscode-settings.json",
        },
        {
          description = "VSCode extensions",
          fileMatch = {
            "extensions.json",
          },
          url = "https://json.schemastore.org/vscode-extensions.json",
        },
        {
          description = "JSON Schema Draft 7",
          fileMatch = {
            "*.schema.json",
          },
          url = "https://json.schemastore.org/schema-draft-07.json",
        },
      },
      format = {
        enable = true,
      },
    },
  },
  -- Agregar filetypes para JSONC
  filetypes = { "json", "jsonc" },
}

-- Configuración especial para pyright (Python)
vim.lsp.config.pyright = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  },
}

-- read :h vim.lsp.config for changing options of lsp servers
