function notes
  set SUBJECT $argv[1]
  if test -z "$SUBJECT"
    nvim ~/notes/NOTES.md
  else
    nvim "$SUBJECT".md ~/notes/NOTES.md
  end
end
