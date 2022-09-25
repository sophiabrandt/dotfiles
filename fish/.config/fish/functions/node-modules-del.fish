function node-modules-del
	fd -t d -I node_modules -x rm -rf '{}' \+;
pnpm store prune
end
