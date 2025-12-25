# Agent Guidelines for NvChad Configuration

This is a Neovim configuration repository based on NvChad v2.5. This repo serves as a user configuration that imports the main NvChad plugin framework.

## Repository Structure

```
lua/
  configs/        # Plugin configurations
  plugins/        # Plugin specifications (lazy.nvim)
  autocmds.lua    # Auto commands
  chadrc.lua      # NvChad-specific config
  mappings.lua    # Key mappings
  options.lua     # Vim options
init.lua          # Entry point
.stylua.toml      # Lua formatter config
lazy-lock.json    # Plugin version lock file
```

## Build/Lint/Test Commands

### Formatting
- **Format Lua files**: `stylua .`
- **Format specific file**: `stylua path/to/file.lua`
- **Check formatting**: `stylua --check .`

### Linting
No dedicated linter is configured. LSP (lua_ls) provides diagnostics when Neovim is running.

### Plugin Management
- **Install/update plugins**: Open Neovim and run `:Lazy sync`
- **Check plugin status**: `:Lazy`
- **Update NvChad**: `:Lazy update NvChad`

### Testing
This is a configuration repository with no automated tests. Manual testing requires:
1. Opening Neovim: `nvim`
2. Checking for errors: `:checkhealth`
3. Verifying LSP: `:LspInfo`

## Code Style Guidelines

### File Organization
- Plugin specifications go in `lua/plugins/*.lua`
- Plugin configs go in `lua/configs/*.lua`
- Each plugin file should return a Lua table with plugin spec
- Use NvChad's import system: `require "nvchad.options"`, `require "nvchad.mappings"`

### Lua Formatting (Stylua)
- **Column width**: 120 characters
- **Line endings**: Unix (LF)
- **Indent**: 2 spaces (not tabs)
- **Quote style**: Auto prefer double quotes
- **Call parentheses**: None (omit parentheses for function calls when possible)

### Imports
```lua
-- Require NvChad modules first
require "nvchad.options"

-- Then custom modules
local map = vim.keymap.set
local options = require "configs.conform"
```

### Plugin Specifications
```lua
-- Standard plugin format
return {
  "author/plugin-name",
  event = "BufReadPre",  -- Lazy load on event
  opts = {
    -- Plugin options
  },
  config = function()
    require "configs.plugin-name"
  end,
}
```

### Naming Conventions
- **Files**: lowercase with hyphens or underscores (`lspconfig.lua`, `oil.lua`)
- **Variables**: snake_case (`lazy_config`, `local_map`)
- **Functions**: snake_case
- **Module returns**: Capital `M` for module tables

```lua
local M = {}

M.base46 = {
  theme = "chocolate",
}

return M
```

### Types and Annotations
Use LSP annotations when available:
```lua
---@type ChadrcConfig
local M = {}

---@module 'oil'
---@type oil.SetupOpts
opts = {},
```

### Error Handling
- Check for required dependencies before use
- Use `vim.uv.fs_stat()` for file existence checks
- Validate paths with `vim.fn.stdpath()`

### Comments
```lua
-- Single line comments for brief explanations
-- Comment above the code, not inline

-- Separate comment blocks with blank lines

-- TODO: Use for future tasks
-- NOTE: Use for important notes
-- HACK: Use for temporary solutions
```

### Keymapping
```lua
-- Use descriptive keys
local map = vim.keymap.set

map("n", "<leader>pv", "<cmd> Oil <CR>", { desc = "Toggle oil" })
map("i", "jk", "<ESC>")  -- Simple mappings can omit desc
```

### LSP Configuration
```lua
-- Enable LSP servers
local servers = { "html", "cssls", "gopls" }
vim.lsp.enable(servers)

-- Use NvChad defaults first
require("nvchad.configs.lspconfig").defaults()
```

### Formatter Configuration
```lua
-- In configs/conform.lua
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
  },
}

return options
```

## Best Practices

1. **Lazy Loading**: Prefer lazy loading plugins with `event`, `cmd`, or `keys`
2. **NvChad Integration**: Always require NvChad modules before custom overrides
3. **Module Pattern**: Use explicit `return` for modules, avoid side effects
4. **Plugin Organization**: One plugin per file in `lua/plugins/`
5. **Config Separation**: Keep plugin setup in `lua/configs/`, specs in `lua/plugins/`
6. **Minimal Changes**: Only add what's necessary, leverage NvChad defaults
7. **No Git Tracking**: The `.git` folder can be removed after cloning (it's a template)

## Common Patterns

### Adding a New Plugin
1. Create `lua/plugins/plugin-name.lua`
2. Create `lua/configs/plugin-name.lua` (if complex config needed)
3. Return plugin spec with lazy loading
4. Run `:Lazy sync` in Neovim

### Adding LSP Server
1. Add server name to `lua/configs/lspconfig.lua`
2. Install via Mason: `:Mason`

### Adding Formatter
1. Update `lua/configs/conform.lua` formatters_by_ft
2. Install formatter system-wide or via Mason

## Notes for AI Agents

- This is a **configuration repository**, not an application with tests
- Changes require **restarting Neovim** to take effect
- **Never modify** `lazy-lock.json` manually - it's auto-generated
- **Respect** the NvChad module system and conventions
- **Test changes** by opening Neovim and checking for errors
- **Format all Lua files** with stylua before committing
- Keep configurations **minimal and focused** - NvChad provides defaults
