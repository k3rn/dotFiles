set PATH $HOME/bin $PATH
set fish_greeting ""
set __fish_prompt_hostname (hostname|cut -d . -f 1)
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'

# virtualfish
. ~/Code/virtualfish/virtual.fish
. ~/Code/virtualfish/auto_activation.fish
. ~/Code/virtualfish/global_requirements.fish

# some small function to facilitate the day to day
function glog; git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative; end
function gst; git status; end

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

function pg_start; launchctl load -w /usr/local/Cellar/postgresql/9.3.2/homebrew.mxcl.postgresql.plist; end
function pg_stop; launchctl unload -w /usr/local/Cellar/postgresql/9.3.2/homebrew.mxcl.postgresql.plist; end
