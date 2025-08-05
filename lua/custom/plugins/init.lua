return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },
  -- readline style
  { 'tpope/vim-rsi' },
  -- cs', cs", cs(, cs[, cs{, cs<, cs<', cs<", cs<( for surrounding changes
  { 'tpope/vim-surround' },
  -- crm, crc, cr-, crs for changing case of variables
  { 'tpope/vim-abolish' },
  -- copilot insertion
  { 'github/copilot.vim' },
  -- buffer management
  { 'jlanzarotta/bufexplorer' },
  -- show a breadcrumb bar for the current buffer
  { 'Bekaboo/dropbar.nvim' },
  -- undo tree shows a visual representation of the undo history
  { 'hinell/lsp-timeout.nvim' },
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
  {
    'Almo7aya/openingh.nvim',
    config = function()
      -- for current file page
      vim.api.nvim_set_keymap('n', '<Leader>gf', ':OpenInGHFileLines! <CR>', { silent = true, noremap = true })
      vim.api.nvim_set_keymap('v', '<Leader>gf', ':OpenInGHFileLines! <CR>', { silent = true, noremap = true })
    end,
  },
  {
    'sindrets/diffview.nvim',
    config = function()
      vim.keymap.set('n', '<leader>vo', function()
        vim.cmd 'DiffviewOpen -uno'
      end, { desc = 'version diff [o]pen' })
      vim.keymap.set('n', '<leader>vc', function()
        vim.cmd 'DiffviewClose'
      end, { desc = 'version diff [c]lose' })
      vim.keymap.set('n', '<leader>vf', function()
        vim.cmd 'DiffviewFileHistory %'
      end, { desc = 'version [f]ile history' })
      vim.keymap.set('n', '<leader>vh', function()
        vim.cmd 'DiffviewFileHistory'
      end, { desc = 'version git [h]istory' })
    end,
  },

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = 'openai',
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'dnlhc/glance.nvim',
    config = function()
      vim.keymap.set('n', 'gld', '<CMD>Glance definitions<CR>')
      vim.keymap.set('n', 'glr', '<CMD>Glance references<CR>')
      vim.keymap.set('n', 'gly', '<CMD>Glance type_definitions<CR>')
      vim.keymap.set('n', 'glm', '<CMD>Glance implementations<CR>')
    end,
  },
  {
    'WilliamHsieh/overlook.nvim',
    config = function() 
      vim.keymap.set("n", "god", require("overlook.api").peek_definition, { desc = "Peek definition" })
      vim.keymap.set("n", "gop", require("overlook.api").peek_cursor, { desc = "Peek cursor" })
      vim.keymap.set("n", "gou", require("overlook.api").restore_popup, { desc = "Restore last popup" })
      vim.keymap.set("n", "goU", require("overlook.api").restore_all_popups, { desc = "Restore all popups" })
      vim.keymap.set("n", "goc", require("overlook.api").close_all, { desc = "Close all popups" })
      vim.keymap.set("n", "gos", require("overlook.api").open_in_split, { desc = "Open popup in split" })
      vim.keymap.set("n", "gov", require("overlook.api").open_in_vsplit, { desc = "Open popup in vsplit" })
      vim.keymap.set("n", "got", require("overlook.api").open_in_tab, { desc = "Open popup in tab" })
      vim.keymap.set("n", "goo", require("overlook.api").open_in_original_window, { desc = "Open popup in current window" })
    end,
  },


  -- { 'weilbith/nvim-lsp-smag' },
  -- { 'liuchengxu/vista.vim' },
  -- { 'neoclide/coc.nvim'}
}
