" create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R --exclude=@/home/$USER/.vim/.ctagsignore .
" - use ^] to jump to tag under cursor
" - use g^] for ambiguous tags
" - use ^t to jump back up the tag stack

