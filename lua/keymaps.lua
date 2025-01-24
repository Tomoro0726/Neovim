--neotree
function _G.toggle_neotree()
  local neotree_visible = vim.bo.filetype == "neo-tree"
  if neotree_visible then
    vim.cmd('Neotree close')
  else
    vim.cmd('Neotree left reveal')
  end
end

vim.keymap.set('n', '<C-f>', ':lua toggle_neotree()<CR>', { noremap = true, silent = true })

--terminal
function _G.toggle_terminal()
  local terms = require("toggleterm.terminal")
  local term = terms.get_all()[1]
  if term and term:is_open() then
    term:toggle()
  else
    vim.cmd('ToggleTerm')
  end
end

vim.keymap.set('n', '<C-t>', ':lua toggle_terminal()<CR>', { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Escape key exits terminal mode
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')

-- ToggleTerm内でjjをESCの代わりにする
vim.api.nvim_create_autocmd("TermEnter", {
  pattern = "*",
  callback = function()
    vim.keymap.set('t', 'jj', '<C-\\><C-n>', { buffer = true, noremap = true, silent = true })
  end
})

-- Map to leader key + q
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- ウインドウ間の移動
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
