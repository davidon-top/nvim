-- local db = require('dashboard')
-- 
local header = {"",
    " /$$   /$$                     /$$    /$$ /$$              ",
    "| $$$ | $$                    | $$   | $$|__/              ",
    "| $$$$| $$  /$$$$$$   /$$$$$$ | $$   | $$ /$$ /$$$$$$/$$$$ ",
    "| $$ $$ $$ /$$__  $$ /$$__  $$|  $$ / $$/| $$| $$_  $$_  $$",
    "| $$  $$$$| $$$$$$$$| $$  \\ $$ \\  $$ $$/ | $$| $$ \\ $$ \\ $$",
    "| $$\\  $$$| $$_____/| $$  | $$  \\  $$$/  | $$| $$ | $$ | $$",
    "| $$ \\  $$|  $$$$$$$|  $$$$$$/   \\  $/   | $$| $$ | $$ | $$",
    "|__/  \\__/ \\_______/ \\______/     \\_/    |__/|__/ |__/ |__/",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
}
-- db.custom_header = header
-- db.custom_center = {
--     {
--         icon = '  ',
--         desc ='File Browser                            ',
--         action =  'Telescope file_browser',
--         shortcut = 'SPC e e'
--     },
-- }

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = header
dashboard.section.buttons.val = {
    dashboard.button("SPC e e", " File Tree", ":NeoTreeFloatToggle<cr>"),
    dashboard.button("OP", "Open Project", ":OP<cr>"),
    dashboard.button("Config", "Open Config", ":Config<cr>"),
}

-- dashboard.section.footer.opts.hl = "Constant"
-- dashboard.section.header.opts.hl = "Include"
-- dashboard.section.buttons.opts.hl = "Function"
-- dashboard.section.buttons.opts.hl_shortcut = "Type"
dashboard.opts.opts.noautocmd = true

require("alpha").setup(dashboard.opts)
