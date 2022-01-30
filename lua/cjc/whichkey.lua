local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local n_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local n_mappings = {
  f = {
    name = "file",
    f = { "<CMD>Telescope find_files<CR>", "find file" },
    g = { "<CMD>Telescope live_grep<CR>", "grep" },
  },

  o = {
    name = "open",
    e = { "<CMD>Lexplore 30<CR>", "explorer" },
  },
}

which_key.setup()
which_key.register(n_mappings, n_opts)

