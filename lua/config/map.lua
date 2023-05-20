vim.g.mapleader = " "
vim.g.maplocalleader = " "

local wk = require("which-key")

local keys = {
    a = {"<cmd>Copilot suggestion accept<cr>", "Copilot"},
    e = {
        name = "Toggle",
        e = {"<cmd>NeoTreeFloatToggle<CR>", "NeoTree"},
        w = {vim.cmd.Ex, "netrw"},
        l = {
            name = "LSP",
            k = {"<cmd>LspStop<cr>", "Stop"},
            s = {"<cmd>LspStart<cr>", "Start"},
        },
        g = {"<cmd>NeoTreeFloatToggle git_status<CR>", "Git Status"},
        b = {"<cmd>NeoTreeFloatToggle buffers<CR>", "Buffers"},
        c = {"<cmd>NeoTreeClose<CR>" , "Close"},
        s = {"<cmd>Navbuddy<CR>" , "Symbols"},
        o = {function () require("oil").open_float(vim.fn.getcwd()) end, "Oil"},
    },
    c = {
        name = "LSP",
        S = {"<cmd>AerialToggle<cr>", "Symbol sidebar"},
        w = {function () vim.lsp.buf.workspace_symbol("") end, "workspace symbol"},
        d = {function () vim.diagnostic.open_float() end, "diagnostic"},
        a = {function () vim.lsp.buf.code_action() end, "code actions"},
        r = {function () vim.lsp.buf.references() end, "references"},
        n = {function () vim.lsp.buf.rename() end, "rename"},
        h = {function () vim.lsp.buf.hover() end, "Hover"},
        t = {function () vim.lsp.buf.type_definition() end,"Type Definition"},
        s = {"<cmd>Navbuddy<cr>", "Navbuddy"},
        -- s = {require("telescope.builtin").lsp_document_symbols, "Document Symbols"},
        o = {
            name = "Copilot",
            a = {"<cmd>Copilot suggestion accept<cr>", "Accept"},
            w = {"<cmd>Copilot suggestion accept_word<cr>", "Word"},
            l = {"<cmd>Copilot suggestion accept_line<cr>", "Line"},
            d = {"<cmd>Copilot suggestion dismiss<cr>", "Decline"},
            n = {"<cmd>Copilot suggestion next<cr>", "Next"},
            p = {"<cmd>Copilot suggestion prev<cr>", "Previous"},
            t = {"<cmd>Copilot suggestion toggle_auto_trigger", "toggle"},
            P = {
                name = "Panel",
                t = {"<cmd>Copilot panel open<cr>", "Open"},
                r = {"<cmd>Copilot panel refresg<cr>", "Refresh"},
                n = {"<cmd>Copilot panel jump_next<cr>", "Next"},
                p = {"<cmd>Copilot panel jump_prev<cr>", "Previous"},
                a = {"<cmd>Copilot panel accept<cr>", "Accept"},
            },
        },
        g = {
            name = "Goto Preview",
            d = {function () require('goto-preview').goto_preview_definition() end, "Definition"},
            r = {function () require('goto-preview').goto_preview_references() end, "References"},
            t = {function () require("goto-preview").goto_preview_type_definitions() end, "Type"},
            i = {function () require("goto-preview").goto_preview_implementation() end, "Implementation"},
            c = {function () require("goto-preview").close_all_win() end, "Close"},
        },
    },
    q = {
        name = "Nvim",
        q = {"<cmd>q<cr>", "Quit"},
        W = {"<cmd>wq<cr>", "Save and Quit"},
        w = {"<cmd>w<cr>", "Save"},
    },
    u = {"vim.cmd.UndotreeToggle", "UndoTree"},
    b = {
        name = "Buffer",
        h = {vim.cmd.bprevious, "Previous"},
        l = {vim.cmd.bnext, "Next"},
        H = {vim.cmd.bfirst, "First"},
        L = {vim.cmd.blast, "Last"},
        b = {require("telescope.builtin").buffers, "Picker"},
        c = {"<cmd>:bp | sp | bn | bd<cr>", "Close"},
    },
    f = {
        name = "Telescope & fzf",
        c = {require("telescope.builtin").colorscheme, "Find Colorscheme"},
        d = {require("telescope.builtin").diagnostics, "Find Diagnostics"},
        w = {require("telescope.builtin").grep_string, "Find current Word"},
        f = {require("telescope.builtin").find_files, "telescope find files"},
        g = {require("telescope.builtin").live_grep, "live grep"},
        b = {require("telescope.builtin").buffers, "buffers"},
        h = {require("telescope.builtin").help_tags, "help tags"},
        s = {function () require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")}); end, "grep search through files"},
        p = {"<cmd>Telescope projects<cr>", "Projects"},
    },
    s = {
        name = "Settings",
        c = {function ()
            vim.opt.scrolloff = 100
        end, "Always center cursor"},
        x = {function ()
            vim.opt.scrolloff = 8
        end, "Disable Cursor center"},
        f = {function ()
            vim.opt.nu = true
            vim.opt.relativenumber = true
        end, "Fix number and relative numbers"},
        m = {function ()
            vim.cmd[[
                highlight CursorColumn guibg=none ctermbg=none
                highlight link CursorColumn CursorLine
            ]]
        end, "Fix cursor highlight"},
    },
    h = {
        name = "Hop",
        w = {"<cmd>HopWord<cr>", "Word"},
        a = {"<cmd>HopAnywhere<cr>", "Anywhere"},
        l = {"<cmd>HopLine<cr>", "Line"},
        p = {"<cmd>HopPattern<cr>", "Pattern"},
        c = {"<cmd>HopChar1<cr>", "Char1"},
        x = {"<cmd>HopChar2<cr>", "Char2"},
        h = {vim.cmd.HopChar2, "Hop"},
    },
    d = {
        name = "Debug",
        b = {function () require("dap").toggle_breakpoint() end, "toggle breakpoint"},
        c = {function () require("dap").continue() end, "launch or continue execution"},
        s = {function () require("dap").step_into() end, "step into"},
        o = {function () require("dap").step_over() end, "step over"},
        r = {function () require("dap").repl.open() end, "open repl"},
        w = {
            name = "Debug UI",
            b = {function () require("dapui").float_element("breakpoints", {}) end, "open breakpoints window"},
            c = {function () require("dapui").float_element("console", {}) end, "open integrated console"},
            r = {function () require("dapui").float_element("repl", {}) end, "open repl"},
        }
    },
    w = {
        name = "workspace",
        a = {vim.lsp.buf.add_workspace_folder, "add folder"},
        r = {vim.lsp.buf.remove_workspace_folder, "remove folder"},
        l = {function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "list folders"},
    },
}

wk.register(keys, {prefix = "<leader>"})
wk.register(keys, {prefix = "<C-Space>"})
wk.register(keys, {prefix = "<C-Space>", mode = "i"})
wk.register(keys, {prefix = "<C-Space>", mode = "v"})

-- LSP
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc = "goto definition"})
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {})
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc = "goto next"})
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc = "goto prev"})
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.hover() end, {})

-- term
vim.keymap.set("n", "<C-\\>", vim.cmd.ToggleTerm)
vim.keymap.set("t", "<C-\\>", vim.cmd.ToggleTerm)

-- center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- visual move
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")

-- me lazy
vim.keymap.set("i", "<C-c>", "<Esc>")


-- non char keybinds
vim.keymap.set("n", "<leader>f/", function ()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, {desc = "fuzzy find"})
vim.keymap.set('n', '<leader>f?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })

vim.keymap.set("i", "<C-Space>f/", function ()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, {desc = "fuzzy find"})
vim.keymap.set('i', '<C-Space>f?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
