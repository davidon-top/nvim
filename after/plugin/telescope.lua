require "telescope".setup {
    pickers = {
      colorscheme = {
        enable_preview = true
      }
    }

}

pcall(require("telescope").load_extension, "fzf")
require("telescope").load_extension("dap")
require('telescope').load_extension('projects')
