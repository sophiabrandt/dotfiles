#!/bin/bash

__lower() {
	echo "$@"|tr "[:upper:]" "[:lower:]"
}

__menu() {
	local result=""
	PS3=$1
	shift
	select opt in "$@" "Cancel"; do
		if [[ $REPLY =~ ^[0-9]+$ ]] && [[ $REPLY -le ${#options[@]} ]]; then
			result=$opt
			break
		else
			result="CANCEL"
			break
		fi
	done
	echo $result
}

# tmux wrapper
# 	tm session-name [window-name]
# Names can be partial from the beginning and first match will connect.
# If no match is found a new session will be created.
# If there's a second argument, it will be used to attach directly to a
# window in the session, or to name the first window in a new session.
#
# Update 2019-12-12
# Case insensitive session/window matching
# Allow numeric index for window (by index)
# Create new named window if second argument passed but no existing match
# Replace a bunch of sed and awk crud with -F params
# Add select menus when running without arguments
__tm() {
	local tmux_cmd
	tmux_cmd=${TM_TMUX_COMMAND:-"tmux"}
	local attach window cleft cright

	if [[ -n $TMUX ]]; then
		echo "Already in a tmux session"
		return 1
	fi

	if [ -n "$1" ]; then
		attach=""

		tmux has-session -t $1 > /dev/null
		if [ $? -eq 0 ]; then
			attach=$1
			shift
		else
			for session in `tmux ls -F '#S'`;do
				cleft=$(__lower $session)
				cright=$(__lower $1)
				if [[ $cleft =~ ^$cright  ]]; then
					echo "Matched session: $session"
					attach=$session
					shift
					break
				fi
			done
		fi

		if [[ $attach != "" ]]; then
			if [ $# -eq 1 ]; then
				if [[ "$1" =~ [0-9]+ ]]; then
					window=$1
				else
					for win in `tmux list-windows -F '#W' -t $attach`;do
						cleft=$(__lower $win)
						cright=$(__lower $1)
						if [[ $cleft =~ ^$cright ]]; then
							echo "Matched window: $window"
							window=$win
							break
						fi
					done
				fi
				if [[ -n $window ]]; then
					$tmux_cmd attach -t $attach:$window
				else
					$tmux_cmd new-window -t $attach -n $1
					$tmux_cmd attach -t $attach:$1
				fi
			else
				$tmux_cmd attach -t $attach
			fi
		else
			if [ $# -gt 1 ]; then
				attach=$1
				shift
				$tmux_cmd new -s $attach -n $1
			else
				echo "Attempting to create $1"
				$tmux_cmd new -s $1
			fi
		fi
	else
		$tmux_cmd ls &>/dev/null
		if [[ $? -gt 0 ]]; then
			$tmux_cmd new
			return 0
		fi
		if $(which fzf &>/dev/null); then
			attach=$(tmux ls -F '#S'|fzf +m --cycle -1 --height=8 --layout=reverse-list --prompt="Choose session> ")
			if [[ -n $attach ]]; then
				declare -a windows=( $(tmux list-windows -t $attach -F '#W') )
				if [[ ${#windows} > 1 ]]; then
					window=$(printf '%s\n' ${windows[@]}|fzf +m --cycle -1 --height=8 --layout=reverse-list --prompt="Choose window> ")
					$tmux_cmd attach -t $attach:$window
				else
					$tmux_cmd attach -t $attach
				fi
			fi
		else
			options=($($tmux_cmd ls -F '#S'))
			if [[ ${#options[@]} -gt 1 ]]; then
				attach=$(__menu "Select session: " "${options[@]}")
				if [[ "$attach" != "CANCEL" ]]; then
					options=($($tmux_cmd list-windows -t $attach -F '#W'))
					if [[ ${#options[@]} -gt 1 ]]; then
						window=$(__menu "Select window: " "${options[@]}")
						if [[ $window == "CANCEL" ]]; then
							return 0
						fi
					else
						window=${options[0]}
					fi
					$tmux_cmd attach -t $attach:$window
				fi
			else
				$tmux_cmd attach -t ${options[0]}
			fi
		fi
	fi
}

__tm $@
