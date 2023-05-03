local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {"string"},
        javascript = {"template_string"},
    },
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",

})

local ts_conds = require("nvim-autopairs.ts-conds")
