vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd('colorscheme default')
vim.opt.clipboard = "unnamedplus"

local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Python LSP support
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "nvim-lualine/lualine.nvim",

  -- auto-completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",

 {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end
},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash Jump"
    },
  },
  },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = true
    },

{
  "michaeljsmith/vim-indent-object",
  event = "BufReadPre",
},
  {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {} 
  },

  {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  }
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
})

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

vim.cmd.colorscheme('catppuccin')

-- 启用 lualine 状态栏
require("lualine").setup({
  options = {
    theme = "catppuccin",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})

-- keymap
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Clear search highlight" })

vim.keymap.set("n", "H", "^", { desc = "Jump to line first non-blank" })
vim.keymap.set("n", "L", "g_", { desc = "Jump to line last non-blank" })

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())


-- Formatter
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
  },
})

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })


vim.opt.timeoutlen = 300

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

local Terminal = require("toggleterm.terminal").Terminal
local python_runner = Terminal:new({
  cmd = "python " .. vim.fn.expand("%"),
  direction = "float",  -- Optional: "float", "vertical"
  close_on_exit = false,
  hidden = true,
})

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  python_runner:toggle()
end, { desc = "Run Python file" })
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- show `space`
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", extends = "»", precedes = "«" }

vim.keymap.set("n", "J", "5j", { noremap = true, silent = true })
vim.keymap.set("n", "K", "5k", { noremap = true, silent = true })
