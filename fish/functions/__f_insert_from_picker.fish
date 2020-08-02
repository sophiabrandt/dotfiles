function __f_insert_from_picker -d "Launch f in picker mode and insert selection(s) to commandline"
    set -l paths (__f -ko 2> /dev/null)
    set -ga __f_temp_exclude_files $paths

    set paths (string escape -n $paths)

    commandline -i (printf '%s ' $paths)
    commandline -f repaint
end
