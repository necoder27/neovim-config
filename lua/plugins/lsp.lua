return {
  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      
      -- Pyright configuration
      lspconfig.pyright.setup {
        settings = {
          pyright = {
            typeCheckingMode = "basic"
          }
        },
        on_attach = function(client, bufnr)
          -- Custom keymappings
          local opts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        end
      }

      lspconfig.volar.setup {
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  	init_options = {
   	  vue = {
	    hybridMode = false,
          },
        },
      }

      require'lspconfig'.cssls.setup{}

      -- Global diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end
  },
  
  -- Mason for LSP management
  {
    'williamboman/mason.nvim',
    cmd = "Mason",
    config = function()
      require("mason").setup({
      	ensure_installed = {"pyright", "vue-language-server", "css-lsp"},  
      })
    end
  }
}
