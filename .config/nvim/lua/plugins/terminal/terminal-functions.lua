local M = {}

M.functions = function()
  local ok = require("utils.check-requires").check({ "toggleterm" })

  if not ok then
    return
  end

  local Terminal = require("toggleterm.terminal").Terminal

  local node = Terminal:new({ cmd = "node", hidden = true })
  local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
  local htop = Terminal:new({ cmd = "htop", hidden = true })
  local python = Terminal:new({ cmd = "python", hidden = true })

  local _NODE_TOGGLE = function()
    node:toggle()
  end

  local _NCDU_TOGGLE = function()
    ncdu:toggle()
  end

  local _HTOP_TOGGLE = function()
    htop:toggle()
  end

  local _PYTHON_TOGGLE = function()
    python:toggle()
  end

  return {
    _NODE_TOGGLE,
    _NCDU_TOGGLE,
    _HTOP_TOGGLE,
    _PYTHON_TOGGLE,
  }
end

return M
