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
