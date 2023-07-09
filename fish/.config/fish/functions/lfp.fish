function lfp --description 'lf file picker'
    if ! type -q lf
        echo "lf not installed"
    end

    set -l TEMP (mktemp)
    lf -selection-path=$TEMP
    echo >>"$TEMP"
    while read -r line
        echo "$line"
    end <"$TEMP"
end
