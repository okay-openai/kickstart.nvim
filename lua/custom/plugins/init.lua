return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },
  -- readline style
  { 'tpope/vim-rsi' },
  -- copilot insertion
  { 'github/copilot.vim' },
  -- buffer management
  { 'jlanzarotta/bufexplorer' },
  -- undo tree shows a visual representation of the undo history
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>pu', function()
        vim.cmd ':UndotreeToggle'
      end, { desc = '[P]anel [U]ndotree' })
    end,
    init = function()
      vim.g.undotree_WindowLayout = 3
    end,
  },
  -- automatic session saving
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      allowed_dirs = { '~/code/*', '~/.config/nvim/' },
      -- log_level = 'debug',
    },
  },
  {
    'stevanmilic/nvim-lspimport',
    config = function()
      vim.keymap.set('n', '<leader>ci', require('lspimport').import, { noremap = true, desc = '[C]ode Quickfix [I]mport' })
    end,
  },
  -- { 'liuchengxu/vista.vim' },
  -- { 'neoclide/coc.nvim'}
}
