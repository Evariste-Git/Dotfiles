return {
	"catppuccin/nvim",
	name = "catppuchin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
		})

		-- apply catppuccin
		vim.cmd.colorscheme("catppuccin")
	end,
}
