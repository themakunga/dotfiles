local km = require("utils.keymap").keymap

km("n", "K", vim.lsp.buf.hover, { desc = "Get information in cursor" })
km("n", "gd", vim.lsp.buf.definition, {})
km({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
