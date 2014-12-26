set PATH $PATH $HOME/bin $HOME/Code/go/bin
set fish_greeting ""
set __fish_prompt_hostname (hostname|cut -d . -f 1)
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set HULK /Volumes/Hulk/
set -x GOPATH /Users/kern/Code/go

# virtualfish
set -g VIRTUALFISH_COMPAT_ALIASES
set -g PROJECT_HOME $HOME/Code
. ~/Code/virtualfish/virtual.fish
. ~/Code/virtualfish/auto_activation.fish
. ~/Code/virtualfish/global_requirements.fish
. ~/Code/virtualfish/projects.fish

# some small function to facilitate the day to day
function glog; git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative; end
function gst; git status; end

function pg_start; pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start; end
function pg_stop;  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop; end

alias tmux "tmux -2"
alias vimt "vim -c 'NERDTree|autocmd VimEnter * wincmd p'"
alias crontab "env EDITOR=vim crontab"

function reload;. ~/.config/fish/config.fish; end
