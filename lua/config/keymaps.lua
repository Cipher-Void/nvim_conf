-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_create_user_command("Q", function()
  local bufs = vim.tbl_filter(function(b)
    return vim.bo[b].buflisted
  end, vim.api.nvim_list_bufs())

  if #bufs <= 1 then
    vim.cmd("quit")
  else
    Snacks.bufdelete()
  end
end, {})

vim.cmd([[cnoreabbrev q Q]])
