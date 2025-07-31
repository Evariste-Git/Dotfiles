return {
    "catppuccin/nvim",

    name = "catppuchin",

    -- set catppuchin to the highest loading priority
    priority = 1000,

    lazy = false,

    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            -- enable automatic integration of other neovim plugins
            auto_integrations = true,
        })

        -- apply catppuccin
        vim.cmd.colorscheme("catppuccin")
    end,
}
