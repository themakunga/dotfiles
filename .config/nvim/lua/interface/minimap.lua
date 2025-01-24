local M = {}

M.plugin = {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    init = function()
        -- The following options are recommended when layout == "float"
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36 -- Set a large value
        vim.g.neominimap = {
            auto_enable = true,
        }
    end,

    setup = function()
        M.setup()
    end,
}


M.setup = function()
    local ok = require("utils.check-requires").check({ "neominimap", })
    if not ok then
        return
    end

    local km = vim.keymap.set

    -- Global Minimap Controls
    km("n", "<leader>nm", "<cmd>Neominimap toggle<cr>", { desc = "Toggle global minimap" })
    km("n", "<leader>no", "<cmd>Neominimap on<cr>", { desc = "Enable global minimap" })
    km("n", "<leader>nc", "<cmd>Neominimap off<cr>", { desc = "Disable global minimap" })
    km("n", "<leader>nr", "<cmd>Neominimap refresh<cr>", { desc = "Refresh global minimap" })

    -- Window-Specific Minimap Controls
    km("n", "<leader>nwt", "<cmd>Neominimap winToggle<cr>", { desc = "Toggle minimap for current window" })
    km("n", "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", { desc = "Refresh minimap for current window" })
    km("n", "<leader>nwo", "<cmd>Neominimap winOn<cr>", { desc = "Enable minimap for current window" })
    km("n", "<leader>nwc", "<cmd>Neominimap winOff<cr>", { desc = "Disable minimap for current window" })

    -- Tab-Specific Minimap Controls
    km("n", "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", { desc = "Toggle minimap for current tab" })
    km("n", "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", { desc = "Refresh minimap for current tab" })
    km("n", "<leader>nto", "<cmd>Neominimap tabOn<cr>", { desc = "Enable minimap for current tab" })
    km("n", "<leader>ntc", "<cmd>Neominimap tabOff<cr>", { desc = "Disable minimap for current tab" })

    -- Buffer-Specific Minimap Controls
    km("n", "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", { desc = "Toggle minimap for current buffer" })
    km("n", "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", { desc = "Refresh minimap for current buffer" })
    km("n", "<leader>nbo", "<cmd>Neominimap bufOn<cr>", { desc = "Enable minimap for current buffer" })
    km("n", "<leader>nbc", "<cmd>Neominimap bufOff<cr>", { desc = "Disable minimap for current buffer" })

    ---Focus Controls
    km("n", "<leader>nf", "<cmd>Neominimap focus<cr>", { desc = "Focus on minimap" })
    km("n", "<leader>nu", "<cmd>Neominimap unfocus<cr>", { desc = "Unfocus minimap" })
    km("n", "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", { desc = "Switch focus on minimap" })
end

if not pcall(debug.getlocal, 4, 1) then
    M.setup()
end

return M
