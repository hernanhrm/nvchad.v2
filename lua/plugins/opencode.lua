return {
  "NickvanDyke/opencode.nvim",
  lazy = false,
  dependencies = {
    ---@module 'snacks'
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    { "<leader>oa", function()
      require("opencode").ask "@this: "
    end, mode = { "n", "v" }, desc = "OpenCode: Ask" },
    { "<leader>oA", function()
      require("opencode").ask("@this: ", { submit = true })
    end, mode = { "n", "v" }, desc = "OpenCode: Ask and submit" },
    { "<leader>ox", function()
      require("opencode").select()
    end, mode = { "n", "v" }, desc = "OpenCode: Select action" },
    { "<leader>os", function()
      require("opencode").select_server()
    end, mode = "n", desc = "OpenCode: Select server" },
    { "<leader>ot", function()
      require("opencode").toggle()
    end, mode = { "n", "t" }, desc = "OpenCode: Toggle" },
    { "go", function()
      return require("opencode").operator "@this "
    end, mode = { "n", "v" }, expr = true, desc = "OpenCode: Operator range" },
    { "goo", function()
      return require("opencode").operator "@this " .. "_"
    end, mode = "n", expr = true, desc = "OpenCode: Operator line" },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true
    local wk = require "which-key"
    wk.add {
      { "<leader>o", group = "OpenCode", mode = { "n", "v" } },
    }
  end,
}