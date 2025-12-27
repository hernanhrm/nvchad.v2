local options = {
  defaults = {
    -- Configuración predeterminada de Telescope
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden", -- Incluir archivos ocultos en búsquedas
      "--no-ignore", -- Incluir archivos en .gitignore
    },
  },
  pickers = {
    find_files = {
      hidden = true, -- Mostrar archivos ocultos
      no_ignore = true, -- Mostrar archivos en .gitignore
      -- Opcionalmente puedes descomentar la siguiente línea para buscar en node_modules, .git, etc.
      -- no_ignore_parent = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden", "--no-ignore" }
      end,
    },
  },
}

return options
