local M = {}

M.with_theme = function(theme)
  require'lualine'.setup({
    options = {
      icons_enabled = true,
      theme = theme,
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

M.config = function()
  M.with_theme('onedark')
end

M.plugin = {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons'},
  config = [[require'plugins.lualine'.config()]]
}

return M

