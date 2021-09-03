local M = {}

-- https://stackoverflow.com/a/4991602
local function file_exists(name)
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

local function parent_dir(path)
  return path:match("(.*)[/\\]")
end

-- Looks for the given root file name in a directory adjacent to or parenting
-- the file at the given file path
local function find_root_dir(file_path, root_file_name)
  local home_dir = parent_dir(os.getenv('HOME'))

  local current_path = file_path
  local parent_path = parent_dir(file_path)

  while current_path ~= parent_path do
    local path_to_check = parent_path .. '/' .. root_file_name
    if (file_exists(path_to_check)) then
      return parent_path
    end

    current_path = parent_path
    parent_path = parent_dir(current_path)
  end

  return nil
end

local SUPPORTED_FORMATTERS = {
  prettier = { cmd = 'Neoformat prettier', root_pattern = '.prettierrc.js' },
}

M.format = function (formatter)
  local formatter = SUPPORTED_FORMATTERS[formatter]
  if formatter == nil then
    return
  end

  local file_path = vim.fn.expand('%:p')
  if find_root_dir(file_path, formatter.root_pattern) == nil then
    return
  end

  vim.cmd(formatter.cmd)
end

return M
