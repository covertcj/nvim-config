local M = {}

M.is_windows = function ()
  return vim.fn.has('win32') == 1
end

M.merge_tables = function (existing_table, new_values)
  local new_table = {}

  for k,v in pairs(existing_table) do
    new_table[k] = v
  end

  for k,v in pairs(new_values) do
    new_table[k] = v
  end

  return new_table
end

return M
