-- using nvim-tree because its faster than neotree

return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    git = {
      enable = false
    },
    update_focused_file = {
      enable = true
    }
  },
  keys = {
    { '<Leader>pt', ':NvimTreeToggle<CR>', desc = '[P]anel Neo[T]ree', silent = true },
  },
}
