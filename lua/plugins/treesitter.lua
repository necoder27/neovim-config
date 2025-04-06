return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = {"lua", "python"},

			highlight = {
				enable = true,
			},
		}
	end,
}
