require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- oil
map('n', '<leader>pv', '<cmd> Oil <CR>', {desc = "Toggle oil"})

-- search and replace
map("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word in cursor" })

-- yank to clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- paste keeping register
map("x", "p", '"_dP', { desc = "Keep pasted text after pasted" })

-- Telescope buffers
map("n", "<leader><leader>", function()
  require("telescope.builtin").buffers {
    sort_mru = true,
    ignore_current_buffer = true,
    only_cwd = false,
  }
end, { desc = "Switch to last buffer" })

-- LSP keybinds
map("n", "gD", function() require("telescope.builtin").lsp_definitions() end, { desc = "LSP: [G]oto [D]efinition" })
map("n", "gr", function() require("telescope.builtin").lsp_references() end, { desc = "LSP: [G]oto [R]eferences" })
map("n", "gi", function() require("telescope.builtin").lsp_implementations() end, { desc = "LSP: [G]oto [I]mplementation" })
map("n", "<leader>D", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "LSP: Type [D]efinition" })
map("n", "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "LSP: [D]ocument [S]ymbols" })
map("n", "<leader>ws", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "LSP: [W]orkspace [S]ymbols" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
map("n", "gd", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })

