function __f_clean -d "Remove invalid files from data file"
    set -l tmpfile (mktemp $F_DATA.XXXXXX)

    if test -f $tmpfile

        while read -d '|' path remaining
            test -f $path; and printf '%s|%s\n' $path $remaining
        end <$F_DATA >$tmpfile

        command mv -f $tmpfile $F_DATA
    end
end
