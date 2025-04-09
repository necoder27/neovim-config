return {
  "windwp/nvim-ts-autotag",
  config = function()  -- Use 'config' instead of 'conf'
    require('nvim-ts-autotag').setup({
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
      filetypes = { "html", "xml", "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },  
    })
  end,
}
