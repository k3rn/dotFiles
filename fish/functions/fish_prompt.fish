function git_status
	set -l branch (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
	if test -n "$branch"
		echo -n '('
		echo -n "$branch"
		set -l gitstatus (git status --porcelain ˆ/dev/null)
		if test -n "$gitstatus"
			if git status --porcelain ˆ/dev/null | grep 'ˆ.[^ ]' >/dev/null
				echo -n '*)'
			else
				echo -n '#)'
			end
		else
			echo -n ')'
		end
	end
end

function fish_prompt --description 'Write out the prompt'
	printf '%s%s@%s%s %s%s%s%s%s%s $ ' \
		(set_color red) $USER \
		$__fish_prompt_hostname (set_color normal) \
		(set_color $fish_color_cwd) (prompt_pwd) (set_color normal) \
	    (set_color yellow) (__fish_git_prompt) (set_color normal)
end
