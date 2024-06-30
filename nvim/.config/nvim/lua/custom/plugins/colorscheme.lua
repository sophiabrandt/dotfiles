-- custom/plugins/colorscheme.lua
local colorscheme = os.getenv 'NVIM_COLORSCHEME' or 'nord'

-- List of color scheme plugins
local colorschemes = {
  -- nord
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      if colorscheme == 'nord' then
        vim.cmd.colorscheme 'nord'
      end
    end,
  },
  -- github
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      if colorscheme == 'github_dark' then
        vim.cmd.colorscheme 'github_dark_dimmed'
      end
      if colorscheme == 'github_light' then
        vim.cmd.colorscheme 'github_light'
      end
    end,
  },
  -- darcula
  {
    'doums/darcula',
    lazy = false,
    priority = 1000,
    config = function()
      if colorscheme == 'darcula' then
        vim.cmd.colorscheme 'darcula'
      end
    end,
  },
  -- falcon
  {
    'fenetikm/falcon',
    lazy = false,
    priority = 1000,
    config = function()
      if colorscheme == 'falcon' then
        vim.cmd.colorscheme 'falcon'
      end
    end,
  },
  -- catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      if colorscheme == 'catppuccin_latte' then
        vim.cmd.colorscheme 'catppuccin-latte'
      end
      if colorscheme == 'catppuccin_mocha' then
        vim.cmd.colorscheme 'catppuccin-mocha'
      end
    end,
  },
}

return colorschemes
