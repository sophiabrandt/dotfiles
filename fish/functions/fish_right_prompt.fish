function fish_right_prompt -d "Display [venvname] if in a virtualenv"
    if set -q VIRTUAL_ENV
      echo -n -s (set_color -b magenta black) '[' (basename "$VIRTUAL_ENV") ']'
    end
    set_color normal
end
