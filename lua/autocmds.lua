require "nvchad.autocmds"

-- Detectar archivos JSONC automáticamente
local autocmd = vim.api.nvim_create_autocmd

-- Archivos .jsonc explícitos
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.jsonc",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

-- Archivos JSON comunes que permiten comentarios
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "tsconfig.json",
    "tsconfig.*.json",
    "jsconfig.json",
    ".babelrc",
    ".eslintrc.json",
    ".prettierrc",
    ".prettierrc.json",
  },
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

-- Archivos en directorios .vscode que permiten comentarios
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".vscode/*.json",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

-- Dadbod completion for SQL files
autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    -- Enable dadbod completion
    require("cmp").setup.buffer {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    }
  end,
})
