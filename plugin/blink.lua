  vim.pack.add({
    -- a completion plugin with support for LSPs, cmdline, signature help, and snippests
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
    -- snippets collection for a set of different programming languages
    "https://github.com/rafamadriz/friendly-snippets",
  })
  require("blink.cmp").setup({
    keymap = { preset = "super-tab" },
    completion = {
      documentation = {
	auto_show = true,
	auto_show_delay_ms = 500,
	window = { border = "rounded" },
      },
    },
    cmdline = {
      keymap = { preset = "inherit" },
      completion = { menu = { auto_show = true } },
    }

  })



