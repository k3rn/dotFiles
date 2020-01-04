set PATH $HOME/Code/dotFiles/bin $HOME/homebrew/bin $HOME/Code/go/bin $HOME/.local/bin $PATH
set fish_greeting ""
set __fish_prompt_hostname (hostname|cut -d . -f 1)
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set -x GOPATH /Users/kern/Code/go
set -x EDITOR vim
set -gx LC_ALL en_US.UTF-8
set -gx HOMEBREW_CASK_OPTS "--appdir=~/Applications"

source ~/Code/dotFiles/fish/shortcuts.fish
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# some small function to facilitate the day to day
function glog; git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative; end
function gst; git status; end

function pg_start; pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start; end
function pg_stop;  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop; end
function start_docker; docker-machine start $argv[1]; eval (docker-machine env $argv[1]); end
function stop_docker; docker-machine stop $argv[1]; eval (docker-machine env -u); end

alias :wq "exit"
alias :q "exit"
alias tmux "tmux -2"
alias vimt "vim -c 'NERDTree|autocmd VimEnter * wincmd p'"
alias cask "brew cask"
alias airport "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias mas "reattach-to-user-namespace mas"
function reload;source ~/.config/fish/config.fish; end
