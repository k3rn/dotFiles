export EDITOR=VIM

source $(fzf-share)/key-bindings.bash
source ~/git-prompt.sh

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
PATH="$PATH:~/.local/bin:~/Code/dotFiles/bin"
GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$BOLD\u@\h \w\$(__git_ps1) $ $NORMAL"
# PS1+=""
alias gst="git status"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative;"
alias gcm="git commit -m"
alias ..="cd .."

function take() {
	mkdir -p $1
	cd $1
}

function reload() {
	source ~/.bashrc
}
