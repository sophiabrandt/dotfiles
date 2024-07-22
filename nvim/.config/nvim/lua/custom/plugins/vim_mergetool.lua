return {
  'idbrii/vim-mergetool',
  opts = {},
  config = function()
    vim.cmd [[
      let g:mergetool_layout = 'mr'
      let g:mergetool_prefer_revision = 'local'
    ]]
  end,
}
