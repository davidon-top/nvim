local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

vim.api.nvim_create_user_command("OP", function ()
    local folders = vim.fn.systemlist("\\ls -d $HOME/projects/*/")
    for i, folder in ipairs(folders) do
        folders[i] = string.match(string.match(folder, "[^/]*/$"), "^[^/]*")
    end
    pickers.new({}, {
        prompt_title = "Open folder",
        finder = finders.new_table {
            results = folders
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                selection = selection[1]
                vim.cmd("cd $HOME/projects/" .. selection)
            end)
            return true
        end
    }):find()
end, {})

vim.api.nvim_create_user_command("Config", function ()
    vim.cmd("cd $HOME/.config/nvim")
    vim.cmd("NeoTreeFloatToggle")
end, {})
