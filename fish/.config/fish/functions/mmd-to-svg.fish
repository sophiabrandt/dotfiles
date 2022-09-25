function mmd-to-svg
	fd -e mmd -x pnpx mmdc -i {} -o '{.}'.svg \+
end
