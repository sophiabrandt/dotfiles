if test -z "$F_DATA"
    if test -n "$XDG_DATA_HOME"
        set -U F_DATA_DIR "$XDG_DATA_HOME/f"
    else 
        set -U F_DATA_DIR "$HOME/.local/share/f"
    end
    set -U F_DATA "$F_DATA_DIR/data"
end

if test ! -e "$F_DATA"
    if test ! -e "$F_DATA_DIR"
        mkdir -p -m 700 "$F_DATA_DIR"  
    end
    touch "$F_DATA"
end

if test -z "$F_CMD"
    set -U F_CMD "f"
end

if not set -q F_EXCLUDE
    set -U F_EXCLUDE '^/tmp/.+'
end

function $F_CMD -d "Open files fuzzily"
    __f $argv
end

function __f_on_event_postexec --on-event fish_postexec
    set -l paths (__f_extract_paths $argv)

    for path in $paths
        if not contains -- $path $__f_temp_exclude_files
            __f_add $path
        end
    end

    set -e __f_temp_exclude_files
    return 0
end

# Setup completions once first
__f_complete

function f_uninstall --on-event f_uninstall
    functions -e __f_on_event_postexec
    functions -e $F_CMD

    if test -n "$F_DATA"
        echo "To purge f's data, remove: $F_DATA" > /dev/stderr
    end

    set -e F_CMD
    set -e F_DATA
    set -e F_EXCLUDE
end
