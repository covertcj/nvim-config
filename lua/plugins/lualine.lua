local M = {}

local function config()
  require'lualine'.setup({
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename', 'diff'},
      lualine_x = {}, -- {'encoding', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  })
end

M.plugin = {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons'},
  config = config
}

return M

