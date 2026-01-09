local M = {}

M.settings = {
  flutter = {
    lsp = {
      on_attach = function(client, bufnr)
        require("nvchad.configs.lspconfig").on_attach(client, bufnr)
      end,
      capabilities = require("nvchad.configs.lspconfig").capabilities,
    },
    debugger = {
      enabled = true,
      run_via_dap = true,
    },
    dev_log = {
      enabled = true,
      open_cmd = "tabedit",
    },
    outline = {
      open_cmd = "30vnew",
    },
    ui = {
      border = "rounded",
      notification_style = "native",
    },
  },
}

M.dart = {
  lsp = {
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
        updateImportsOnRename = true,
      },
    },
  },
}

return M
