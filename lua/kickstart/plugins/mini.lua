return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- use gc and gcc for commenting
      require('mini.comment').setup()

      -- trim ending whitespace (silently)
      vim.keymap.set('n', '<leader>cw', function()
        require('mini.trailspace').trim()
      end, {desc = '[C]lean [W]hitespace'})

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
