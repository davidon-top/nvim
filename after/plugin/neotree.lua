require("neo-tree").setup({
    source_selector = {
        winbar = true,
        statusline = false,
    },
})


vim.keymap.set("n", "<C-\\>", vim.cmd.ToggleTerm)
vim.keymap.set("t", "<C-\\>", vim.cmd.ToggleTerm)
