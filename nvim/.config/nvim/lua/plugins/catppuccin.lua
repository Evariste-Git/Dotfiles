return {
    "catppuccin/nvim",

    name = "catppuchin",

    -- set catppuchin to the highest loading priority
    priority = 1000,

    -- catppuchin does not support lazy-loading
    lazy = false,

    opts = {
        flavour = "macchiato",

        -- disable setting the background color
        transparent_background = true,

        -- enable automatic integration of other neovim plugins
        auto_integrations = true,
    },

    config = function(_, opts)
        require("catppuccin").setup(opts)

        -- apply catppuccin
        vim.cmd.colorscheme("catppuccin")
    end,
}
