local M = {}

M.setup_keys = function(wk)
  local nmap = {}
  local vmap = {}
  local omap = {}
  local xmap = {}

  nmap['<leader><space>'] = { [[<CMD>Telescope find_files<CR>]], 'find file' }


  --[ Files ]--
  nmap['<leader>f'] = {
    name = 'files',
    f = { [[<CMD>Telescope find_files<CR>]], 'find file' },
    g = { [[<CMD>Telescope live_grep<CR>]], 'grep files' },
    s = { [[<CMD>write<CR>]], 'save' },
  }

  
  --[ Buffer Management ]--
  nmap['<leader>b'] = {
    name = 'buffers',
    b = { [[<CMD>Telescope buffers<CR>]], 'find buffer' },
  }


  --[ Help ]--
  nmap['<leader>h'] = {
    name = 'help',
    h = { [[<CMD>Telescope help_tags<CR>]], 'help tags' },
  }


  --[ Git Keys ]--
  nmap['<leader>g'] = {
    name = 'git',
    g = { [[<CMD>Git<CR>]], 'status' },
    b = { [[<CMD>:Gitsigns toggle_current_line_blame<CR>]], 'inline blame' },
    B = { [[<CMD>Git blame<CR>]], 'blame' },

    h = {
      name = 'hunk',
      s = {[[<CMD>lua require"gitsigns".stage_hunk()<CR>]], 'stage hunk'},
      u = {[[<CMD>lua require"gitsigns".undo_stage_hunk()<CR>]], 'unstage hunk'},
      r = {[[<CMD>lua require"gitsigns".reset_hunk()<CR>]], 'reset hunk'},
      p = {[[<CMD>lua require"gitsigns".preview_hunk()<CR>]], 'preview hunk'},
    },

    R = {[[<CMD>lua require"gitsigns".reset_buffer()<CR>]], 'reset buffer'},
  }

  vmap['<leader>g'] = {
    name = 'git',
    h = {
      name = 'hunk',
      s = {[[<CMD>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>]], 'stage hunk'},
      r = {[[<CMD>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>]], 'reset hunk'},
    },
  }


  --[ Settings Keys ]--
  nmap['<leader>t'] = {
    name = 'settings',
    t = { [[<CMD>ToggleTheme<CR>]], 'theme' },
  }


  --[ Open Things ]--
  nmap['<leader>o'] = {
    name = 'open',
    f = { [[<CMD>CHADopen<CR>]], 'file tree' },
  }


  --[ Note Taking ]--
  nmap['<leader>n'] = {
    name = 'notes',
    i = { [[<CMD>edit ~/notes/000\ Index.md<CR>]], 'index' },
    n = { [[<CMD>ZettelNew<CR>]], 'new note' },
    -- c = { [[<CMD>ZettelCapture<CR>]], 'capture' },
    f = { [[<CMD>ZettelOpen<CR>]], 'find and open' },
    l = { [[<CMD>ZettelSearch<CR>]], 'link search' },
    y = { [[<CMD>ZettelYankName<CR>]], 'yank name' },
  }


  --[ Jumps ]--
  nmap[']'] = {
    name = 'next',
    c = {[[<CMD>lua require"gitsigns.actions".next_hunk()<CR>]], 'next hunk'},
  }

  nmap['['] = {
    name = 'prev',
    c = {[[<CMD>lua require"gitsigns.actions".prev_hunk()<CR>]], 'prev hunk'},
  }


  --[ Text Object ]--
  omap['i'] = {
    h = {[[:<C-U>lua require"gitsigns.actions".select_hunk()<CR>]], 'git hunk'}
  }
  
  xmap['i'] = {
    h = {[[:<C-U>lua require"gitsigns.actions".select_hunk()<CR>]], 'git hunk'}
  }


  --[ Misc ]--
  nmap['<C-l>'] = {[[<CMD>noh<CR>]], 'clear'}

  local map = vim.api.nvim_set_keymap
  map('t', [[<Esc>]], [[<C-\><C-N>]], {noremap = true})
  map('t', [[<C-]>]], [[<Esc>]], {noremap = true})

  wk.register(nmap, { mode = 'n' })
  wk.register(vmap, { mode = 'v' })
  wk.register(omap, { mode = 'o' })
  wk.register(xmap, { mode = 'x' })
end

M.apply_lsp_keymapping = function (lsp_client)
  local wk = require'which-key'
  local capabilities = lsp_client.resolved_capabilities
  local mode = { name = 'mode' }
  local modeV = { name = 'mode' }

  mode.d = {[[<CMD>Lspsaga show_line_diagnostics<CR>]], 'diagnostic', buffer=0}
  mode.D = {[[<CMD>Telescope lsp_document_diagnostics<CR>]], 'file diagnostics', buffer=0}
  mode.w = {[[<CMD>Telescope lsp_workspace_diagnostics<CR>]], 'workspace diagnostics', buffer=0}

  wk.register({
    ['[e'] = {[[<CMD>Lspsaga diagnostic_jump_prev<CR>]], 'prev diagnostic', buffer=0},
    [']e'] = {[[<CMD>Lspsaga diagnostic_jump_next<CR>]], 'next diagnostic', buffer=0},
  })

  if capabilities.document_formatting then
    mode.f = {[[<CMD>Format<CR>]], 'format', buffer=0}
  end

  if capabilities.code_action then
    mode.a = {[[<CMD>:Lspsaga code_action<CR>]], 'code actions', buffer=0}
    modeV.a = {[[<CMD>:Lspsaga code_action<CR>]], 'code actions', buffer=0}
  end

  if capabilities.rename then
    mode.r = {[[<CMD>Lspsaga rename<CR>]], 'rename', buffer=0}
  end

  if capabilities.document_symbol then
    mode.s = {[[<CMD>Telescope lsp_document_symbols<CR>]], 'symbols', buffer=0}
  end

  if capabilities.workspace_symbol then
    mode.S = {[[<CMD>Telescope lsp_workspace_symbols<CR>]], 'workspace symbols', buffer=0}
  end

  if capabilities.goto_definition then
    wk.register({
      ['gd'] = { [[<CMD>Telescope lsp_implementations<CR>]], 'goto definition' },
    })

    mode.p = { [[<CMD>Lspsaga preview_definition<CR>]], 'preview definition' }
  end

  if capabilities.implementation then
    wk.register({
      ['gi'] = { [[<CMD>Telescope lsp_implementations<CR>]], 'goto implementation' }
    })

    mode.R = {[[<CMD>Telescope lsp_references<CR>]], 'references', buffer=0}
  end

  if capabilities.hover then
    mode.c = {[[<CMD>lua vim.lsp.buf.hover()<CR>]], 'under cursor', buffer=0}
  end

  if capabilities.signature_help then
    mode.C = {[[<CMD>lua vim.lsp.buf.signature_help()<CR>]], 'signature', buffer=0}
  end

  wk.register(
    { m = mode },
    { prefix = '<leader>', mode = 'n' }
  )

  wk.register(
    { m = mode },
    { prefix = '<leader>', mode = 'v' }
  )
end

vim.g.floaterm_keymap_toggle = '<F4>'
vim.g.floaterm_keymap_new = '<F5>'
vim.g.floaterm_keymap_next = '<F3>'
vim.g.floaterm_keymap_prev = '<F2>'
  
return M

