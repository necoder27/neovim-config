return {
  -- Diagnostic UI
  {
    'folke/trouble.nvim',
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("trouble").setup {
        icons = true,
        signs = {
          error = "E",
          warning = "W",
          hint = "H",
          information = "I"
        },
        use_diagnostic_signs = true
      }

      -- Trouble Keymaps
      vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {silent = true, noremap = true})
      vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', {silent = true, noremap = true})
      vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', {silent = true, noremap = true})
    end
  }
}
