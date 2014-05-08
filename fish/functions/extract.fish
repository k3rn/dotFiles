function extract;
	if not test -n "$argv"
		echo 'Usage: extract [file ...]';
	else
		for i in (seq (count $argv))
			if not test -f $argv[$i]
				echo "File $argv[$i] is not a regular file."
			else
				switch $argv[$i]
					case '*.tar.gz' '*.tgz'
						tar xvzf $argv[$i];
					case '*.tar.bz2' '*.tbz' '*.tbz2'
						tar xvjf $argv[$i];
					case '*.tar.xz' '*.txz'
						tar xJf $argv[$i];
					case '*.tar.zma' '*.tlz'
						tar xf $argv[$i] --lzma;
					case '*.tar'
						tar xvf $argv[$i];
					case '*.gz'
						gunzip $argv[$i];
					case '*.bz2'
						bunzip2 $argv[$i];
					case '*.xz'
						unxz $argv[$i];
					case '*.lzma'
						unlzma $argv[$i];
					case '*.Z'
						uncompress $argv[$i];
					case '*.zip' '*.war' '*.jar'
						unzip $argv[$i];
					case '*.rar'
						set -l exists (which unrar)
						if test -n "$exists"
							unrar xr $argv[$i];
						else
							echo 'Please install unrar.'
						end
					case '*.7z'
						set -l exists (which 7za)
						if test -n "$exists"
							7za x $argv[$i];
						else
							echo 'Please install 7zip.'
						end
					case '*'
						echo "extract: $argv[$i] cannot be extracted.";
				end
			end
		end
	end
end
