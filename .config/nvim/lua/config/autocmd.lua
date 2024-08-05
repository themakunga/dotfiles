local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

autocmd({ "FileChangedShellPost" }, {
	command = "echohl WarningMsg | echo 'File changed on disk. Buffer reoladed' | echohl None",
	pattern = { "*" },
})
