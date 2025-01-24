-- LSP関連の設定
local lspconfig = require("lspconfig")

-- nvim-cmpの設定
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(),        -- 次の候補へ移動
    ["<C-p>"] = cmp.mapping.select_prev_item(),        -- 前の候補へ移動
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 候補を確定
    ["<C-Space>"] = cmp.mapping.complete(),            -- 補完を表示
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- tsserver (TypeScript/JavaScript用) の設定
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- LSPのキーマッピングを設定
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)     -- 定義へジャンプ
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)     -- 参照を表示
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)           -- ホバーを表示
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 名前変更
  end,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
})

-- LuaSnipのスニペットをロード
require("luasnip.loaders.from_vscode").lazy_load()
