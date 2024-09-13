return {
  {
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      on_colors = function(colors)
        colors.border = '#565f89'
        -- colors.bg_dark = '#1a1b26'
      end,
      -- dim_inactive = true,
    },
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'levouh/tint.nvim',
    init = function()
      require('tint').setup {
        tint = -15,
        saturation = 0.3,
        tint_background_colors = true, -- Tint background portions of highlight groups
        highlight_ignore_patterns = { 'WinSeparator', 'Status.*' }, -- Highlight group patterns to ignore, see `string.find`

        window_ignore_function = function(winid)
          local bufid = vim.api.nvim_win_get_buf(winid)
          local buftype = vim.api.nvim_buf_get_option(bufid, 'buftype')
          local ignoredFiletypes = {
            'DiffviewFiles',
            'DiffviewFileHistory',
            'alpha',
            'checkhealth',
            'fzf',
            'lazy',
            'lspsagafinder',
            'mason',
            'neo-tree',
            'packer',
            'plugin',
            'registers',
            'startuptime',
            'trouble',
            'undotree',
            'zsh',
          }
          local ignoredBuftypes = { 'terminal' }

          local isDiff = vim.api.nvim_win_get_option(winid, 'diff')
          local isFloating = vim.api.nvim_win_get_config(winid).relative ~= ''
          local isIgnoredBuftype = vim.tbl_contains(ignoredBuftypes, vim.api.nvim_buf_get_option(bufid, 'buftype'))
          local isIgnoredFiletype = vim.tbl_contains(ignoredFiletypes, vim.api.nvim_buf_get_option(bufid, 'filetype'))

          -- Do not tint `terminal` or floating windows, tint everything else
          return buftype == 'terminal' or isFloating or isIgnoredFiletype or isIgnoredBuftype or isDiff
        end,
      }
    end,
  },
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function()
      local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
      require('tiny-devicons-auto-colors').setup({
        colors=colors
      })
    end,
  },
}
