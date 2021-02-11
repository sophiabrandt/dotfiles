# Defined in /home/owlhoot/.config/fish/functions/sptlauncher.fish @ line 1
function sptlauncher
	kill -9 spotifyd >/dev/null 2>&1
	spotifyd
	spt
end
