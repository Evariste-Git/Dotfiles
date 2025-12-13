-- regulary run :TSUpdate to update all the parsers

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    -- nvim-treesitter does not support lazy loading
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            -- parsers that are ensured to be installed
            -- a list of names or "all"
            ensure_installed = { "bibtex", "c", "cpp", "css", "json", "jsonc", "just", "latex", "lua", "rust", "yaml" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end,
}
