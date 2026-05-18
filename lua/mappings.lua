require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- oil
map("n", "<leader>pv", "<cmd> Oil <CR>", { desc = "Toggle oil" })

-- search and replace
map(
  "n",
  "<leader>s",
  [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace word in cursor" }
)

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

-- FFF keybinds (overriding NvChad telescope file/grep pickers)
map("n", "<leader>ff", function()
  require("fff").find_files()
end, { desc = "FFF: Find files" })
map("n", "<leader>fw", function()
  require("fff").live_grep()
end, { desc = "FFF: Live grep" })
map("n", "<leader>fz", function()
  require("fff").live_grep { grep = { modes = { "fuzzy", "plain" } } }
end, { desc = "FFF: Fuzzy grep" })
map("n", "<leader>fc", function()
  require("fff").live_grep { query = vim.fn.expand "<cword>" }
end, { desc = "FFF: Search current word" })

-- LSP keybinds
map("n", "gD", function()
  require("telescope.builtin").lsp_definitions()
end, { desc = "LSP: [G]oto [D]efinition" })
map("n", "gr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "LSP: [G]oto [R]eferences" })
map("n", "gi", function()
  require("telescope.builtin").lsp_implementations()
end, { desc = "LSP: [G]oto [I]mplementation" })
map("n", "<leader>D", function()
  require("telescope.builtin").lsp_type_definitions()
end, { desc = "LSP: Type [D]efinition" })
map("n", "<leader>ds", function()
  require("telescope.builtin").lsp_document_symbols()
end, { desc = "LSP: [D]ocument [S]ymbols" })
map("n", "<leader>ws", function()
  require("telescope.builtin").lsp_dynamic_workspace_symbols()
end, { desc = "LSP: [W]orkspace [S]ymbols" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
map("n", "gd", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })

-- Dadbod UI (Database client)
map("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "DBUI: Toggle UI" })
map("n", "<leader>da", "<cmd>DBUIAddConnection<CR>", { desc = "DBUI: Add Connection" })
map("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>", { desc = "DBUI: Find Buffer" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })

-- Flutter keybindings
map("n", "<leader>fr", "<cmd>FlutterRun<CR>", { desc = "Flutter: Run App" })
map("n", "<leader>fR", "<cmd>FlutterReload<CR>", { desc = "Flutter: Hot Reload" })
map("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter: Quit" })
map("n", "<leader>fd", "<cmd>FlutterDevTools<CR>", { desc = "Flutter: DevTools" })
map("n", "<leader>fs", "<cmd>FlutterSelectDevice<CR>", { desc = "Flutter: Select Device" })

-- Rust keymaps (rustaceanvim)
map("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", { desc = "Rust: Runnables" })
map("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", { desc = "Rust: Debuggables" })
map("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", { desc = "Rust: Expand Macro" })
map("n", "<leader>rc", "<cmd>RustLsp openCargo<CR>", { desc = "Rust: Open Cargo.toml" })
map("n", "<leader>rp", "<cmd>RustLsp parentModule<CR>", { desc = "Rust: Parent Module" })
map("n", "<leader>ri", "<cmd>RustLsp inlayHints toggle<CR>", { desc = "Rust: Toggle Inlay Hints" })
