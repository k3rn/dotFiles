set PATH $HOME/Code/dotFiles/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.poetry/bin $PATH
set fish_greeting ""
set __fish_prompt_hostname (hostname|cut -d . -f 1)
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set -x EDITOR vim
set -gx LC_ALL en_US.UTF-8

source ~/Code/dotFiles/fish/shortcuts.fish
source /usr/share/fish/functions/fzf.fish

# some small function to facilitate the day to day
function glog; git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative; end
function gst; git status; end

alias :wq "exit"
alias :q "exit"
alias tmux "tmux -2"
alias vimt "vim -c 'NERDTree|autocmd VimEnter * wincmd p'"
function reload;source ~/.config/fish/config.fish; end
