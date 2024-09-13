return {
  {
    'folke/trouble.nvim',
    opts = {
      warn_no_results = false,
      follow = true,
      auto_preview = false,
      modes = {
        symbols = { -- Configure symbols mode
          win = {
            type = 'split', -- split window
            relative = 'win', -- relative to current window
            position = 'right', -- right side
            size = 60, -- 30% of the window
          },
        },
        fzf = {
          win = {
            size = 0.3,
          },
        },
        fzf_files = {
          win = {
            size = 0.3,
          },
        },
      },
    },
    keys = {
      {
        '<leader>pD',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[P]anel All [D]iagnostics',
      },
      {
        '<leader>pd',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = '[P]anel Buffer [d]iagnostics',
      },
      {
        '<leader>pf',
        '<cmd>Trouble fzf<cr>',
        desc = '[P]anel [f]zf search',
      },
      {
        '<leader>pF',
        '<cmd>Trouble fzf_files<cr>',
        desc = '[P]anel [F]zf files',
      },
      {
        '<leader>ps',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = '[P]anel [S]ymbols',
      },
      {
        '<leader>pl',
        '<cmd>Trouble lsp toggle focus=false win.position=left<cr>',
        desc = '[P]anel LSP Definitions / references / ...',
      },
      {
        '<leader>pL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = '[P]anel [L]ocation List',
      },
      {
        '<leader>pQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = '[P]anel [Q]uickfix List',
      },
    },
  },
}
