-- [ Load Configs ]
-- -- [[ Setting options ]] --
-- See `:help vim.opt`
require 'config.settings'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
require 'config.keymaps'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- TODO: require autocommands here
require 'config.autocommands'

require 'plugins.lazy'
-- [[ lazy ]]
--
-- [[ some lazy work ]]
--
-- [[ Advanced Keymaps ]]
-- TODO: require Harpoon keymaps

