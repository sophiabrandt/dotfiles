function nr
nvim (rg --files-with-matches $argv | fzy)
end
