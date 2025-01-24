local M = {}

M.plugin = {
    "folke/which-key.nvim",
    dependencies = {
        { 'echasnovski/mini.icons',      version = '*' },
        { "nvim-tree/nvim-web-devicons", opts = {} },
    },
    event = "VeryLazy",
    config = function()
        M.setup()
    end,
}

M.setup = function()
    local ok = require('utils.check-requires').check({ 'which-key' })
    if not ok then
        return
    end

    local whichkey = require('which-key')

    local setup = {
        plugins = {
            marks = true,         -- shows a list of your marks on ' and `
            registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true,      -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true,      -- default bindings on <c-w>
                nav = true,          -- misc bindings to work with windows
                z = true,            -- bindings for folds, spelling and others prefixed with z
                g = true,            -- bindings for prefixed with g
            },
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        keys = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>",   -- binding to scroll up inside the popup
        },
        win = {
            border = "rounded",       -- none, single, double, shadow
            position = "bottom",      -- bottom, top
            margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3,                    -- spacing between columns
            align = "left",                 -- align columns left, center or right
        },
        show_help = true,                   -- show help message on the command line when the popup is visible
    }


    local mappings = {
        ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    }
    whichkey.setup(setup);
end

if not pcall(debug.getlocal, 4, 1) then
    M.setup()
end

return M
