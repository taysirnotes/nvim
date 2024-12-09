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

-- [ Enabled/Disabled plugins ]
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- [[ Required at the begninning ]]
  -- See `:help gitsigns` to understand what the configuration keys do.
  -- Adds gitsigns recommend keymaps.
  require 'plugins.view.gitsigns',
  require 'plugins.view.which-key', -- Useful plugin to show you pending keybinds.
  require 'plugins.tools.fuzzy-finder', -- For files, lsp, etc

  -- [[ LSP Plugins ]]
  -- [[[ Language Servers ]]]
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins used for completion,
  -- annotations and signatures of Neovim apis.
  require 'plugins.lsp.lazydev',
  { 'Bilal2453/luvit-meta', lazy = true },
  require 'plugins.lsp.lspconfig', -- Contains Mason and most language servers
  { 'tpope/vim-cucumber', lazy = true },
  -- [[[ Linting ]]]
  require 'plugins.lsp.linting.autoformat',
  require 'plugins.lsp.linting.autocompletion',
  -- [[[ Treesitter ]]]
  -- Highlight, edit, and navigate code
  require 'plugins.lsp.treesitter',

  -- [[ Testing ]]
  require 'plugins.test.debug.dap',

  -- [[ Tools ]]
  require 'plugins.tools.pomo',
  require 'plugins.tools.harpoon',
  require 'plugins.tools.oil',

  -- [[ Edit ]]
  require 'plugins.edit.indent-line',
  require 'plugins.lsp.linting.lint',
  require 'plugins.edit.autopairs',
  require 'plugins.view.colorscheme',
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  require 'plugins.edit.mini',
  require 'plugins.edit.obsidian',

  -- [[ View ]]
  require 'plugins.view.neo-tree',

  -- For additional information with loading, sourcing and examples use telescope:
  --   In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  --   you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- [ Temporary set here ]
-- [[ Harpoon Keymaps ]]
local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = '[A]dd to Harpoon' })
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<C-h>', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<C-t>', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<C-n>', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<C-s>', function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-k>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-j>', function()
  harpoon:list():next()
end)

