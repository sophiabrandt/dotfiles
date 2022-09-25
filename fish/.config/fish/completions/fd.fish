complete -f -c fd
complete -c fd -l no-ignore-vcs -d "Show search results from files and directories that would otherwise be ignored by '.gitignore' files.; no-ignore-vcs" -r -f
complete -c fd -l regex -d "Perform a regular-expression based search (default). This can be used to override --glob.; regex" -r -f
complete -c fd -l show-errors -d "Enable the display of filesystem errors for situations such as insufficient permissions or dead symlinks.; show-errors" -r -f
complete -c fd -l one-file-system -d "By default, fd will traverse the file system tree as far as other options dictate. With this flag, fd ensures that it does not descend into a; one-file-system" -r -f
complete -c fd -l min-depth -d "Only show search results starting at the given depth. See also: '--max-depth' and '--exact-depth'; min-depth" -r -f
complete -c fd -l exact-depth -d "Only show search results at the exact given depth. This is an alias for '--min-depth <depth> --max-depth <depth>'.; exact-depth" -r -f
complete -c fd -l ignore-file -d "Add a custom ignore-file in '.gitignore' format. These files have a low precedence.; ignore-file" -r -f
complete -c fd -l changed-within -d "Filter results based on the file modification time. The argument can be provided as a specific point in time (YYYY-MM-DD HH:MM:SS) or as a; changed-within" -r -f
complete -c fd -l changed-before -d "Filter results based on the file modification time. The argument can be provided as a specific point in time (YYYY-MM-DD HH:MM:SS) or as a; changed-before" -r -f
complete -c fd -l max-results -d "Limit the number of search results to 'count' and quit immediately.; max-results" -r -f
complete -c fd -l base-directory -d "Change the current working directory of fd to the provided path. The means that search results will be shown with respect to the given base path.; base-directory" -r -F
complete -c fd -l path-separator -d "Set the path separator to use when printing file paths. The default is the OS-specific separator ('/' on Unix, '\' on Windows).; path-separator" -r -f
complete -c fd -l search-path -d "Provide paths to search as an alternative to the positional <path> argument. Changes the usage to `fd [FLAGS/OPTIONS] --search-path <path>; search-path" -r -f
complete -c fd -l hidden -s H -d "Include hidden directories and files in the search results (default: hidden files and directories are skipped). Files and directories are; hidden" -r -f
complete -c fd -l no-ignore -s I -d "Show search results from files and directories that would otherwise be ignored by '.gitignore', '.ignore' or '.fdignore' files.; no-ignore" -r -f
complete -c fd -l unrestricted -s u -d "Alias for '--no-ignore'. Can be repeated. '-uu' is an alias for '--no-ignore --hidden'.; unrestricted" -r -f
complete -c fd -l case-sensitive -s s -d "Perform a case-sensitive search. By default, fd uses case-insensitive searches, unless the pattern contains an uppercase character (smart case).; case-sensitive" -r -f
complete -c fd -l ignore-case -s i -d "Perform a case-insensitive search. By default, fd uses case-insensitive searches, unless the pattern contains an uppercase character (smart case).; ignore-case" -r -f
complete -c fd -l glob -s g -d "Perform a glob-based search instead of a regular expression search.; glob" -r -f
complete -c fd -l fixed-strings -s F -d "Treat the pattern as a literal string instead of a regular expression.; fixed-strings" -r -f
complete -c fd -l absolute-path -s a -d "Shows the full path starting from the root as opposed to relative paths.; absolute-path" -r -f
complete -c fd -l list-details -s l -d "Use a detailed listing format like 'ls -l'. This is basically an alias for '--exec-batch ls -l' with some additional 'ls' options. This can be; list-details" -r -f
complete -c fd -l follow -s L -d "By default, fd does not descend into symlinked directories. Using this flag, symbolic links are also traversed.; follow" -r -f
complete -c fd -l full-path -s p -d "By default, the search pattern is only matched against the filename (or directory name). Using this flag, the pattern is matched against the full; full-path" -r -f
complete -c fd -l help -s h -d "Prints help information; help" -r -f
complete -c fd -l version -s V -d "Prints version information; version" -r -f
complete -c fd -l max-depth -s d -d "Limit the directory traversal to a given depth. By default, there is no limit on the search depth.; max-depth" -r -f
complete -c fd -l type -s t -d "Filter the search by type (multiple allowable filetypes can be specified):; type" -r -f
complete -c fd -l extension -s e -d "(Additionally) filter search results by their file extension. Multiple allowable file extensions can be specified.; extension" -r -f
complete -c fd -l exec -s x -d "Execute a command for each search result.; exec" -r -f
complete -c fd -l exec-batch -s X -d "Execute a command with all search results at once.; exec-batch" -r -f
complete -c fd -l exclude -s E -d "Exclude files/directories that match the given glob pattern. This overrides any other ignore logic. Multiple exclude patterns can be specified.; exclude" -r -f
complete -c fd -l color -s c -d "Declare when to use color for the pattern match output:; color" -r -f
complete -c fd -l threads -s j -d "Set number of threads to use for searching & executing (default: number of available CPU cores); threads" -r -f
complete -c fd -l size -s S -d "Limit results based on the size of files using the format <+-><NUM><UNIT>.; size" -r -f
