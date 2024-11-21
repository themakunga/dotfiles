local M = {}

M.setup = function()
  local cmd_name_setup = "SetupWindow"
  local cmd_name_clear = "ClearWindow"
  local tab_key = "Window"
  local setup = "80vs | sp | wincmd 1"
  local clear = "wincmd g"

  local get_var = function()
    return vim.api.nvim_tabpage_get_var(0, tab_key)
  end

  local get_state = function()
    if pcall(get_var) then
      return get_var()
    else
      return false
    end
  end

  local set_state = function(val)
    vim.api.nvim_tabpage_set_var(0, tab_key, val)
  end

  local create_cmd = vim.api.nvim_create_user_command

  create_cmd("SetupWindow", function()
    if not get_state() then
      vim.cmd(setup)
      set_state(true)
    end
  end, {})

  create_cmd("ClearWindow", function()
    local tab_total_window = #vim.api.nvim_tabpage_list_wins(0)
    if tab_total_window > 1 then
      vim.cmd(string.rep(clear, tab_total_window - 1, " | "))
    end
    set_state(false)
  end, {})

  create_cmd("ToggleWindow", function()
    if get_state() then
      vim.cmd(cmd_name_clear)
    else
      vim.cmd(cmd_name_setup)
    end
  end, {})
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
