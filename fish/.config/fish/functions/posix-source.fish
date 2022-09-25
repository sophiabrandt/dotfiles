function posix-source --description='Source env files'
  set -l options \
    (fish_opt --short=h --long=help) \
    (fish_opt --short=p --long=print) \
    (fish_opt --short=n --long=no-interpret) \
    (fish_opt --short=G --long=no-global) \
    (fish_opt --short=u --long=unexport) \
    (fish_opt --short=e --long=erase)
  argparse $options -- $argv

  [ (count $argv ) -eq 0 ]; and set _flag_help

  if set -q _flag_help
    set fn (status function)
    echo \
      "USAGE:

      	$fn ( --help | -h )
      		This help message

      	$fn [OPTIONS] FILE ...
      		Source one or more env files


      OPTIONS:

      	-p, --print
      		Print the commands to STDOUT

      	-G, --no-global
      		By default, variables will be set globally. This flag causes
      		variables to be unset at the end of the block.

      	-u, --unexport
      		By default, variables will be exported to child processes.
      		This flag prevents that.

      	-n, --no-interpret
      		By default, variables in env files will be interpreted. Pass
      		this argument to interpret dollar signs as literal characters.

      	-e, --erase
      		Erase all variables listed in the given file(s)." \
    | string replace --all --regex '(^ +)' ''
    return 0
  end

  set -q _flag_no_global
  or set setFlags -g

  set -q _flag_unexport
  or set setFlags -x $setFlags


  for file in $argv
    not [ -f $file ]
    and echo "$file is not a file!" >&2
    and continue

    for instruction in (cat $file)
      set arr (string split -m1 = $instruction)

      set -q _flag_erase
      and set -q _flag_print
      and echo set -e $arr[1]\;
      and continue

      if set -q _flag_erase
        set -e $arr[1]
        continue
      end

      set -q _flag_print
      and echo set $setFlags $arr[1] $arr[2]\;
      and continue

      set -q _flag_no_interpret
      and set $setFlags $arr[1] $arr[2]
      or eval "set $setFlags $arr[1] $arr[2]"
    end
  end

  return 0
end
