function set_theme
  set -f theme $argv[1]
  set -gx NVIM_COLORSCHEME $theme

  echo "Switched to $theme theme"
end
