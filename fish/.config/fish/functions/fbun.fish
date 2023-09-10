function fbun
cat package.json | \
  jq -r '.scripts | keys[]' | \
  fzf --height 30% --reverse -1 -0 -d ',' --with-nth=1 --header 'Select npm script to run' | \
  xargs bun run
end
