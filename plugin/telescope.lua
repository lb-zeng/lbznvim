vim.pack.add({
  -- a fuzzy finder over lists
  "https://github.com/nvim-telescope/telescope.nvim",
  -- a lua module for asynchronous programming using coroutines
  "https://github.com/nvim-lua/plenary.nvim",
  -- FZF sorter for telescope written in c
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local builtin = require("telescope.builtin")
local keymap = vim.keymap

keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Grep in File" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
keymap.set("n", "<leader>fc", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
