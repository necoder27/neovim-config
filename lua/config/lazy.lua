-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Oil Keymaps
vim.keymap.set("n", "<leader>ls", ":Oil<CR>", { desc = "[l]i[s]t Files and Directories" })

vim.keymap.set("n", "<leader>pc", function()
  require("oil").open("~/.config/nvim/lua/plugins")
end, { desc = "Open [P]lugins [C]onfig" })

vim.keymap.set("n", "<leader>tc", function()
  require("oil").open("~/.zshrc")
end, { desc = "Open [T]erminal [C]onfig" })

-- Screen Management Keymaps
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { desc = "Split Screen Vertically" })
vim.keymap.set("n", "<leader>vh", ":split<CR>", { desc = "Split Screen Horizontally" })

-- LSP Keymaps
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[g]o to [i]mplementation" })
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "[g]o to [s]ignature help" })

-- Telescope Keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope [f]ind [f]iles" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope [f]ind [b]uffer" })


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
