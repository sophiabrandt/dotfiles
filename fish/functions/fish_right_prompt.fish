# To show the right prompt please set
# set theme_display_rbenv 'yes' (config.fish)
# set theme_display_rbenv_gemset 'yes' (config.fish)
# set theme_display_rbenv_with_gemfile_only 'yes' (config.fish)

function _ruby_version
  echo (command rbenv version-name | sed 's/\n//')
end

function _ruby_gemset
  echo (command rbenv gemset active 2> /dev/null | sed -e 's| global||')
end

function fish_right_prompt
  if [ "$theme_display_rbenv" = 'yes' ]
    set -l red (set_color red)
    set -l normal (set_color normal)
    set ruby_info $red(_ruby_version)

    if [ "$theme_display_rbenv_gemset" = 'yes' ]
      if [ (_ruby_gemset) ]
        set -l ruby_gemset $red(_ruby_gemset)
        set ruby_info "$ruby_info@$ruby_gemset"
      end
    end

    if [ "$theme_display_rbenv_with_gemfile_only" = 'yes' ]
      if test -f Gemfile
        echo -n -s $ruby_info $normal
      else
        echo -n -s $normal
      end
    else
      echo -n -s $ruby_info $normal
    end
  end
end
