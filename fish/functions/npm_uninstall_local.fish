# Defined in - @ line 1
function npm_uninstall_local --description alias\ npm_uninstall_local=npm\ uninstall\ `ls\ -1\ node_modules\ \|\ tr\ \'/\\n\'\ \'\ \'`
	npm uninstall `ls -1 node_modules | tr '/\n' ' '` $argv;
end
