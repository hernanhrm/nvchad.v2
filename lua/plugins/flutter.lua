return {
  "nvim-flutter/flutter-tools.nvim",
  ft = { "dart", "flutter" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  opts = function()
    return require "configs.flutter"
  end,
  keys = {
    {
      "<leader>fr",
      function()
        require("flutter-tools").run_flutter_app()
      end,
      desc = "Flutter: Run App",
    },
    {
      "<leader>fd",
      function()
        require("flutter-tools").dev_tools()
      end,
      desc = "Flutter: DevTools",
    },
    {
      "<leader>fR",
      function()
        require("flutter-tools").reload()
      end,
      desc = "Flutter: Hot Reload",
    },
    {
      "<leader>fq",
      function()
        require("flutter-tools").quit()
      end,
      desc = "Flutter: Quit",
    },
    {
      "<leader>fs",
      function()
        require("flutter-tools").select_device()
      end,
      desc = "Flutter: Select Device",
    },
  },
}
