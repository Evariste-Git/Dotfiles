-- This is also a good place to setup other settings (vim.opt)

vim.wo.relativenumber = true
vim.wo.number = true
vim.o.cursorline = true

-- remove ~ displayed after the file
vim.opt.fillchars = { eob = " " }

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,

	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})
vim.o.updatetime = 250
local hover_enabled = true
vim.keymap.set("n", "<leader>th", function()
	hover_enabled = not hover_enabled
	print("Hover diagnostics: " .. (hover_enabled and "ON" or "OFF"))
end)
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
        if not hover_enabled then return end
		vim.diagnostic.open_float(nil, {
			focus = false,
		})
	end,
})
