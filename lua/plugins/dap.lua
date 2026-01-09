return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    -- All under <leader>d for Debug (alongside diagnostics)
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Breakpoint",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "Breakpoint (conditional)",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dr",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle UI",
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    require("nvim-dap-virtual-text").setup()

    local function get_delve_path()
      local mason_delve = vim.fn.stdpath "data" .. "/mason/bin/dlv"
      if vim.fn.executable(mason_delve) == 1 then
        return mason_delve
      end
      return vim.fn.exepath "dlv" ~= "" and vim.fn.exepath "dlv" or "dlv"
    end

    require("dap-go").setup {
      delve = {
        path = get_delve_path(),
      },
    }

    local function get_dart_debug_adapter_path()
      local mason_dart = vim.fn.stdpath "data" .. "/mason/bin/dart-debug-adapter"
      if vim.fn.executable(mason_dart) == 1 then
        return mason_dart
      end
      return "dart-debug-adapter"
    end

    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Flutter App",
        dartSdkPath = vim.fn.expand "$HOME/flutter/bin/cache/dart-sdk/",
        flutterSdkPath = vim.fn.expand "$HOME/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
      },
      {
        type = "dart",
        request = "launch",
        name = "Launch Dart Script",
        program = "${workspaceFolder}/${file}",
        cwd = "${workspaceFolder}",
      },
    }

    dap.adapters.dart = {
      type = "executable",
      command = get_dart_debug_adapter_path(),
      args = { "flutter" },
    }
  end,
}
