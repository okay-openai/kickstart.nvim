vim.loader.enable()
-- source vimrc.vim where most options are set
vim.cmd 'source ~/.config/nvim/vimrc.vim'

-- [[ Setting options ]]

vim.g.have_nerd_font = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.undodir = vim.fn.stdpath 'data' .. '/undo'
vim.opt.backupdir = vim.fn.stdpath 'data' .. '/backup'
vim.opt.directory = vim.fn.stdpath 'data' .. '/swap'
vim.opt.laststatus = 2

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {
  require 'kickstart.plugins.colorscheme',
  require 'kickstart.plugins.fzf',
  require 'kickstart.plugins.lsp',
  require 'kickstart.plugins.completion',
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.whiche',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.trouble',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  { import = 'custom.plugins' },
}

 local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
 vim.api.nvim_create_autocmd("FileType", {
 	pattern = { "swift" },
 	callback = function()
 		local root_dir = vim.fs.dirname(vim.fs.find({
 			"Package.swift",
 			".git",
 		}, { upward = true })[1])
 		local client = vim.lsp.start({
 			name = "sourcekit-lsp",
 			cmd = { "sourcekit-lsp" },
 			root_dir = root_dir,
 		})
 		vim.lsp.buf_attach_client(0, client)
 	end,
 	group = swift_lsp,
 })


vim.keymap.set('n', '<Leader>li', function()
  vim.cmd ':Lazy install'
end, { desc = 'lazy install' })
vim.keymap.set('n', '<Leader>lr', function()
  return ':Lazy reload '
end, { desc = 'lazy reload', expr = true })
vim.keymap.set('n', '<Leader>ls', function()
  vim.cmd ':Lazy sync'
end, { desc = 'lazy sync' })
vim.keymap.set('n', '<Leader>ll', function()
  vim.cmd ':Lazy show'
end, { desc = 'lazy show' })
vim.keymap.set('n', '<Leader>lx', function()
  vim.cmd ':Lazy clean'
end, { desc = 'lazy clean' })
vim.keymap.set('n', '<Leader>lc', function()
  vim.cmd ':Lazy clean'
end, { desc = 'lazy clean' })

-- vim: ts=2 sts=2 sw=2 et
