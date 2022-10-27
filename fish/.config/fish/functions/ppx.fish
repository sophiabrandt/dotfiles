function ppx --description 'pnpm --package=<package-name> dlx <command>'
set pkg $argv[1]
set -e argv[1]
pnpm --package=$pkg dlx $argv
end
