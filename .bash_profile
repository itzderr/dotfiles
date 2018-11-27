#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Prompt
#   ------------------------------------------------------------

# Enable git tab completion 
source ~/.git-completion.bash

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

# Change command prompt
# export GIT_PS1_SHOWDIRTYSTATE=1
# export PS1="[\[\033[0;31m\]$(__git_ps1)\[\033[0;36m\] \W \[\033[0m\]] \[\033[1;35m\]$ \[\033[0m\]"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/Users/park/Library/Android/sdk/platform-tools"

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Default Editor
export EDITOR=vim

#   Aliases
#   ------------------------------------------------------------
alias ls='ls -GFh'
alias ll='ls -lah'
alias reload='source ~/.bash_profile'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias bp='vim ~/.bash_profile'
alias vimrc='vim ~/.vimrc'
alias trash='sudo rm -rf ~/.Trash/*'
alias c='clear'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'
alias xcode='open -a Xcode'
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias gitc='vim ~/.gitconfig'
alias e='$EDITOR'
alias du='du -sh'
alias venv='cd ~/.virtualenvs'
alias dev='cd ~/dev'
alias grep='grep --color=auto'
alias readlink='greadlink'
alias npmlsg="npm ls -g --depth=0 "$@" 2>/dev/null"
alias npmls="npm ls --depth=0 "$@" 2>/dev/null"


# iterm
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# rust (cargo)
export PATH="$HOME/.cargo/bin:$PATH"

# Add g functions
source ~/.g.sh

mkdircd() {
  mkdir $1 && cd $1
}

# nvm stuff
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
