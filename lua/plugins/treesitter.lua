return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      }

      local map = vim.keymap.set

      -- Select text objects
      local select = require "nvim-treesitter-textobjects.select"
      for _, mode in ipairs { "x", "o" } do
        map(mode, "af", function()
          select.select_textobject("@function.outer", "textobjects")
        end, { desc = "Select outer function" })
        map(mode, "if", function()
          select.select_textobject("@function.inner", "textobjects")
        end, { desc = "Select inner function" })
        map(mode, "ac", function()
          select.select_textobject("@class.outer", "textobjects")
        end, { desc = "Select outer class" })
        map(mode, "ic", function()
          select.select_textobject("@class.inner", "textobjects")
        end, { desc = "Select inner class" })
        map(mode, "aa", function()
          select.select_textobject("@parameter.outer", "textobjects")
        end, { desc = "Select outer parameter" })
        map(mode, "ia", function()
          select.select_textobject("@parameter.inner", "textobjects")
        end, { desc = "Select inner parameter" })
      end

      -- Move to text objects
      local move = require "nvim-treesitter-textobjects.move"
      local move_modes = { "n", "x", "o" }
      map(move_modes, "]f", function()
        move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function start" })
      map(move_modes, "]c", function()
        move.goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next class start" })
      map(move_modes, "]F", function()
        move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })
      map(move_modes, "]C", function()
        move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })
      map(move_modes, "[f", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function start" })
      map(move_modes, "[c", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous class start" })
      map(move_modes, "[F", function()
        move.goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })
      map(move_modes, "[C", function()
        move.goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })

      -- Swap parameters
      local swap = require "nvim-treesitter-textobjects.swap"
      map("n", "<leader>a", function()
        swap.swap_next "@parameter.inner"
      end, { desc = "Swap next parameter" })
      map("n", "<leader>A", function()
        swap.swap_previous "@parameter.inner"
      end, { desc = "Swap previous parameter" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 20,
      mode = "cursor",
    },
  },
}
