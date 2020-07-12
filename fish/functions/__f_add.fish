function __f_add -d "Add given path to f file"

    if test (count $argv) -gt 1
        echo 'Can only take one argument; more given' > /dev/stderr
        return 1
    end

    set -l filename $argv

    for pattern in $F_EXCLUDE
        if string match -rq -- $pattern $filename
            return 0
        end
    end

    set -l tmpfile (mktemp $F_DATA.XXXXXX)

    if test -f $tmpfile
        set -l filename (string replace --all \\ \\\\ $filename)
    command awk -v path=$filename -v now=(date +%s) -F "|" '
      BEGIN {
          rank[path] = 1
          time[path] = now
      }
      $2 >= 1 {
          if( $1 == path ) {
              rank[$1] = $2 + 1
              time[$1] = now
          }
          else {
              rank[$1] = $2
              time[$1] = $3
          }
          count += $2
      }
      END {
          if( count > 1000 ) {
              for( i in rank ) print i "|" 0.9*rank[i] "|" time[i] # aging
          }
          else for( i in rank ) print i "|" rank[i] "|" time[i]
      }
    ' $F_DATA 2>/dev/null >$tmpfile

    if test -n "$F_OWNER"
      chown $F_OWNER:(id -ng $F_OWNER) $tmpfile
    end

    # Don't use redirection here as it can lead to a race condition where $F_DATA is clobbered.
    # Note: There is a still a possible race condition where an old version of $F_DATA is
    #       read by one instance of Fish before another instance of Fish writes its copy.

    command mv $tmpfile $F_DATA
    or command rm $tmpfile
  end
end
