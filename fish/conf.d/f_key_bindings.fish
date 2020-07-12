function __f_insert_from_picker
    set -l paths (__f -ko 2> /dev/null)
    set -ga __f_temp_exclude_files $paths

    set paths (string escape -n $paths)

    commandline -i (printf '%s ' $paths)
    commandline -f repaint
end

# if not bind \ek
#     bind \ek __f_insert_from_picker
# end

# if not bind -M insert \ek
#     bind -M insert \ek __f_insert_from_picker
# end

# function f_key_bindings_uninstall --on-event f_key_bindings_uninstall
#     bind \ek | string match -e __f_insert_from_picker
#     and bind -e \ek

#     bind -M insert \ek | string match -e __f_insert_from_picker
#     and bind -M insert -e \ek
# end
