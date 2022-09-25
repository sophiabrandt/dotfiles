function wn
nvim  -c "+normal GO## $(date)" -c ':s/$/\r/' -c 'se nohlsearch' $HOME/notes/notes.md
end
