vim.pack.add({
  "https://github.com/mfussenegger/nvim-lint",
})

require("lint").linters_by_ft = {
  -- The clangd LSP has built-in integration with clnag-tidy, so there is no need to use clang-tidy separately.
  -- cpp = { "clang-tidy" },
  python = { "ruff" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("UserLintConfig", { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})
