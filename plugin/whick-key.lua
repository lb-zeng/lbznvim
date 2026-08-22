vim.schedule(function()
  vim.pack.add({
    -- show available keybindings in a popup as you type
    "https://github.com/folke/which-key.nvim",
    -- provides Nerd Font icons (glyphs)
    "https://github.com/nvim-tree/nvim-web-devicons",
  })
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end

  wk.setup({})
end)
