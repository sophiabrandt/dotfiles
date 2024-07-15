return {
  'creativenull/efmls-configs-nvim',
  version = 'v1.*.*', -- version is optional, but recommended
  requires = { 'neovim/nvim-lspconfig' },
  config = function()
    local languages = require('efmls-configs.defaults').languages()
    languages = vim.tbl_extend('force', languages, {
      -- you custom languages, or overrides
      go = {
        require 'efmls-configs.linters.go_revive',
        require 'efmls-configs.formatters.gofumpt',
      },
    })
    require('lspconfig').efm.setup {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { '.git/' },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }
  end,
}
