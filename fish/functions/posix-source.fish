# Defined in /home/owlhoot/.config/fish/functions/posix-source.fish @ line 1
function posix-source
	for i in (cat $argv)
		if test (echo $i | sed -E 's/^[[:space:]]*(.).+$/\\1/g') != "#"
			set arr (echo $i |tr = \n)
			if test $arr[1] != ""
				set -gx $arr[1] $arr[2]
			end
		end
	end
end
