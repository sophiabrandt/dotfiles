function __f_extract_paths -d 'Extract valid paths from string $argv[1]'

    if test (count $argv) -gt 1
        echo 'Can only take one argument; more given' > /dev/stderr
        return 1
    end

    printf '%s' $argv[1] | read -zat tokens
    for token in $tokens
        # Tilde expansion is done only on the commandline
        set -l token (string replace -r -- '^~/' "$HOME/" "$token")
        if test -f "$token"
            printf '%s\n' (builtin realpath -s "$token")
        end
    end

end
