-- ターミナルモードでのウィンドウ移動設定
vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- toggletermを開くショートカット
function _G.toggle_or_open_terminal()
  local terms = require("toggleterm.terminal")
  local term = terms.get_all()[1]
  if term and term:is_open() then
      term:toggle()
  else
      vim.cmd('ToggleTerm')
  end
end

-- Mapping Ctrl+T to toggle or open terminal
vim.keymap.set('n', '<C-t>', ':lua toggle_or_open_terminal()<CR>', { noremap = true, silent = true })