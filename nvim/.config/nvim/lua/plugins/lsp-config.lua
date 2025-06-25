return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = true },
        },
        config = function()
            -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities, -- set this up in EVERY language server!
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<C-a>", vim.lsp.buf.code_action, {})
        end,
    },
}
