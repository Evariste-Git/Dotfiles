-- regulary run :TSUpdate to update all the parsers

return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    -- nvim-treesitter does not support lazy loading
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"c", "css", "just", "lua", "rust"},
            highlight = { enable = true },
            indent = {enable = true },
        })
    end
}

