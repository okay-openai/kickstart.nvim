-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<Leader>pt', ':Neotree toggle<CR>', desc = '[P]anel Neo[T]ree', silent = true },
  },
  opts = {
    buffers = { follow_current_file = { enabled = true } },
    enable_git_status = false,
    enable_diagnostics = false,

    filesystem = {
      follow_current_file = { enabled = true },
      window = {
        mappings = {
          -- disable fuzzy finder
          ['/'] = 'noop',
        },
      },
    },
  },
}
