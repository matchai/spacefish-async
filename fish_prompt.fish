function sf_async_handler --on-signal INFO
	set -l mypid %self
	set -l value (eval echo "\$sf_git_$mypid")
	set -e sf_git_$mypid
	set -g __sf_git_output (echo "$value")
	set -e __sf_git_async_running
	set -g __sf_prompt_refresh
	commandline -f repaint
end

function __sf_git_section
	if set -q __sf_prompt_refresh
		echo -sn $__sf_git_output
		return
	end
	if not set -q __sf_git_async_running
		set -l dir (dirname (status --current-filename))
		set -g __sf_git_async_running
		fish $dir/fish_prompt_async.fish %self &
	end
end

function fish_prompt
	set -g __sf_git_display (__sf_git_section)

	echo "$__sf_git_display $PWD >"
	set -e __sf_prompt_refresh
	set -e __sf_git_display
	set -e __sf_git_output
end
