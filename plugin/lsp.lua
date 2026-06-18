vim.pack.add({
  -- a package manager to instal and manage LSP servers, DAP servers, linters, and formatters
  "https://github.com/mason-org/mason.nvim",
  -- a collection of LSP server configurations
  "https://github.com/neovim/nvim-lspconfig",
  -- bridges mason.nvim withe nvim-lspconfig plugin
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
  },
  -- automatically enable (vim.lsp.enable()) installed servers by default.
  -- automatic_enable = true,
})

vim.diagnostic.config({
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Line Diagnostics"
    keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
    opts.desc = "Diagnostics"
    keymap.set("n", "<leader>sd", builtin.diagnostics, opts)

    opts.desc = "Code Action"
    keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Goto Definition"
    keymap.set("n", "gd", builtin.lsp_definitions, opts)

    opts.desc = "Goto Declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Reference"
    keymap.set("n", "gr", builtin.lsp_references, opts)

    opts.desc = "Goto Implementation"
    keymap.set("n", "gI", builtin.lsp_implementations, opts)

    opts.desc = "Goto Type Definition"
    keymap.set("n", "gy", builtin.lsp_type_definitions, opts)

    opts.desc = "Calls Incoming"
    keymap.set("n", "gai", builtin.lsp_incoming_calls, opts)

    opts.desc = "Calls Outgoing"
    keymap.set("n", "gao", builtin.lsp_outgoing_calls, opts)

    opts.desc = "Prev Diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    opts.desc = "Next Diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})
