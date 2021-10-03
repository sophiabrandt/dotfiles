# Defined in $HOME/.config/fish/functions/sptlauncher.fish @ line 1
function sptlauncher
	kill -15 spotifyd >/dev/null 2>&1
	spotifyd
	spt
end
