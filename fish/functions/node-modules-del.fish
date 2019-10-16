# Defined in - @ line 1
function node-modules-del --description alias\ node-modules-del\ find\ .\ -name\ \"node_modules\"\ -exec\ rm\ -rf\ \'\{\}\'\ +
	find . -name "node_modules" -exec rm -rf '{}' + $argv;
end
