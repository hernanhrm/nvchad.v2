local function get_rust_analyzer_cmd()
  local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/rust-analyzer"
  if vim.fn.filereadable(mason_bin) == 1 then
    return { mason_bin }
  end
  return { "rust-analyzer" }
end

return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  ft = "rust",
  init = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = get_rust_analyzer_cmd(),
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            inlayHints = {
              parameterHints = { enable = true },
              typeHints = { enable = true },
              chainingHints = { enable = true },
            },
            cargo = {
              features = "all",
            },
          },
        },
      },
      dap = {
        adapter = {
          type = "executable",
          command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
        },
      },
    }
  end,
}
