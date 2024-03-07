return {
  'creativenull/efmls-configs-nvim',
  version = 'v1.*.*', -- version is optional, but recommended
  requires = { 'neovim/nvim-lspconfig' },
  config = function()
    local languages = require('efmls-configs.defaults').languages()
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
