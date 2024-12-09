function ColorMyPencils(color)
  color = color or 'rose-pine-moon'
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      terminal_colors = true,
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },

    init = function()
      vim.cmd.colorscheme 'tokyonight-moon'

      -- Configure highlights
      vim.cmd.hi 'Comment gui=none'

      ColorMyPencils()
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = true,
      }
      ColorMyPencils()
    end,
  },
}

