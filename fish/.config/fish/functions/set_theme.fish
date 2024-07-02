function set_theme
  set -f theme $argv[1]
  echo $theme > ~/.colorscheme

  echo "Switched to $theme theme"
end
