function notes
  set SUBJECT $argv[1]
  if test -z "$SUBJECT"
    echo -e "\n## " (date) >> ~/notes/NOTES.md
    hx ~/notes/NOTES.md
  else
    hx "~/notes/$SUBJECT".md ~/notes/NOTES.md
  end
end
