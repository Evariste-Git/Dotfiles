return {
	"catppuccin/nvim",
	name = "catppuchin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
            auto_integrations = true,
		})

		-- apply catppuccin
		vim.cmd.colorscheme("catppuccin")
	end,
}
