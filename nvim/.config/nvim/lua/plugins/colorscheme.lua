return {
  -- add nord theme
  { "nordtheme/vim" },
  { "chiendo97/intellij.vim" },
  { "doums/darcula" },
  { "rebelot/kanagawa.nvim"},

  -- Configure LazyVim to load nord
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
