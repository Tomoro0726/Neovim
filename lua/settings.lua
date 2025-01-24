--自動保存
vim.api.nvim_create_augroup("AutoSaveOnLeave", { clear = true })
vim.api.nvim_create_autocmd("BufLeave", {
  group = "AutoSaveOnLeave",
  pattern = "*",
  command = "silent! w",
})


--定期的な自動保存
local auto_save_timer = vim.loop.new_timer()
auto_save_timer:start(0, 5000, vim.schedule_wrap(function()
  if vim.bo.modified then
    vim.cmd("silent! w")
  end
end))

--Ctrl+Sでの保存
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>a")
vim.keymap.set("v", "<C-S>", "<Esc>:w<CR>gv")
