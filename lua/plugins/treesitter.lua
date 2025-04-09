return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = {"lua", "python", "vue", "css", "typescript", "xml"},

			highlight = {
				enable = true,
			},
		}
	end,
}
