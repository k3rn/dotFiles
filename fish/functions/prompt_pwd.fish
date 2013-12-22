function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
	echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|"
end
