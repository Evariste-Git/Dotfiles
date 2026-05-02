return {
  "catppuccin/nvim",

  name = "catppuchin",

  -- set catppuchin to the highest loading priority
  priority = 1000,

  -- catppuchin does not support lazy-loading
  lazy = false,

  opts = {
    -- set the flavour of catppuchin to use
    -- latte, frappe, macchiato, mocha or auto
    flavour = "macchiato",
    -- if flavour is set to auto
    -- pick color according to system settings (vim.o.background)
    --background = {
    --    light = "latte",
    --    dark = "mocha",
    --},

    -- show '~' after the end of buffer
    show_end_of_buffer = false,

    -- overwride colors of neovim-terminal
    term_colors = false,

    -- TODO: does not work
    -- dim background color of inactive window
    --dim_inactive = {
    --    enabled = true,
    --    shade = "dark",
    --    percentage = 0.90,
    --},

    -- TODO: set things to use italic or bold
    -- and basically everything from now on

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
