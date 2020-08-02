if not bind \ek 2>/dev/null
    bind \ek __f_insert_from_picker
end

if not bind -M insert \ek 2>/dev/null
    bind -M insert \ek __f_insert_from_picker
end

function f_key_bindings_uninstall --on-event f_key_bindings_uninstall
    bind \ek 2>/dev/null | string match -e __f_insert_from_picker
    and bind -e \ek

    bind -M insert \ek 2>/dev/null | string match -e __f_insert_from_picker
    and bind -M insert -e \ek
end
