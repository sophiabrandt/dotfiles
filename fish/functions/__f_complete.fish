function __f_complete -d "add completions"
    # string replace is faster than cut (on test with sample file)
    function __f_marks
        printf "%s\n" (string replace -r '\|.*' '' < $F_DATA)
    end

    complete -fc $F_CMD -a "(__f_marks)"

    complete -c $F_CMD -s k -l pick   -d "Pick a file using fzf"
    complete -c $F_CMD -s K -l picker -d "Set picker program" -xa '(__fish_complete_command)'
    complete -c $F_CMD -s w -l with   -d "Open file using alternate command" -xa '(__fish_complete_command)'
    complete -c $F_CMD -s d -l cd     -d "cd into file's parent dir first"
    complete -c $F_CMD -s a -l app    -d "Open with default app"
    complete -c $F_CMD -s c -l clean  -d "Clean out $F_DATA"
    complete -c $F_CMD -s o -l echo   -d "Print best match, do not open"
    complete -c $F_CMD -s l -l list   -d "List matches, do not open"
    complete -c $F_CMD -s p -l purge  -d "Purge $F_DATA"
    complete -c $F_CMD -s r -l rank   -d "Search by rank and open"
    complete -c $F_CMD -s t -l recent -d "Search by recency and open"
    complete -c $F_CMD -s x -l delete -d "Remove file from database"
    complete -c $F_CMD -s h -l help   -d "Print help"

end
