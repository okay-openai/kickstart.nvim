return {

  {
    'ibhagwan/fzf-lua',
    dependencies = { { 'junegunn/fzf' } },
    config = function()
      local actions = require 'fzf-lua'
      vim.keymap.set('n', '<leader>sf', actions.files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', actions.helptags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', actions.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sw', actions.grep_cword, { desc = '[S]earch [W]ord' })
      vim.keymap.set('n', '<leader>sg', actions.live_grep_native, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>s/', actions.lgrep_curbuf, { desc = '[S]earch Curbuf' })
      vim.keymap.set('n', '<leader>s.', actions.oldfiles, { desc = '[S]earch File History' })
      vim.keymap.set('n', '<leader>sd', actions.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', actions.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>ss', actions.builtin, { desc = '[S]earch [S]elect Search' })

      actions.setup { 'max-perf', fzf_opts = { ['--layout'] = 'default' }, preview_opts = 'hidden' }

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        actions.lines { fzf_opts = { ['--layout'] = 'reverse-list' } }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        actions.files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
