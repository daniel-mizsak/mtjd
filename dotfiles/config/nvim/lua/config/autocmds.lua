-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Per-filetype overrides for rulers and indentation
local ft_group = augroup("user_filetype_settings", {
  clear = true,
})

autocmd("FileType", {
  group = ft_group,
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "80,120"
  end,
})

autocmd("FileType", {
  group = ft_group,
  pattern = "dockerfile",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
