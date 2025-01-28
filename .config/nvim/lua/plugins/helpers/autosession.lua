local M = {}

M.plugin = {
  "rmagatti/auto-session",
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "auto-session" })
  if not ok then
    return
  end

  local auto_session = require("auto-session")

  auto_session.setup({
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {
      "~/",
      "~/Dev/",
      "~/Downloads",
      "~/Documents",
      "~esktop/",
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
