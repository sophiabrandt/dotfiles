function notes
  set SUBJECT $argv[1]
  if test -z "$SUBJECT"
    hx ~/notes/NOTES.md
  else
    hx "$SUBJECT".md ~/notes/NOTES.md
  end
end
