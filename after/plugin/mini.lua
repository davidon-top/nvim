require("mini.ai").setup({
    custom_textobjects = {
        [','] = require("mini.ai").gen_spec.pair(',', ',', {})
    }
})
require("mini.jump").setup({})
require("mini.sessions").setup({autowrite = false, directory = '~/projects/sessions'})

