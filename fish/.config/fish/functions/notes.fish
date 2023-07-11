function notes
  set SUBJECT $argv[1]
  if test -z "$SUBJECT"
    cd ~/notes
    hx NOTES.md
  else
    cd ~/notes
    hx "$SUBJECT".md ~/notes/NOTES.md
  end
end
