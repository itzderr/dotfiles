#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Prompt
#   ------------------------------------------------------------

# Enable git tab completion 
source ~/.git-completion.bash
source ~/dotfiles/.hub_bash_completion.sh

# bash-git-prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  export GIT_PROMPT_ONLY_IN_REPO=0
  export GIT_PROMPT_THEME=Solarized
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Change command prompt
# export PS1="[\[\033[0;31m\]\[\033[0;36m\] \W \[\033[0m\]] \[\033[1;35m\]$ \[\033[0m\]"
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
alias ls='exa --icons'
alias ll='exa -alh'
alias tree='exa -T'
alias reload='source ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias bp='vim ~/.bashrc'
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
alias lightsail='ssh ubuntu@52.42.93.133'
alias hubpr='hub pull-request'

# iterm
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"
export TOOLCHAINS=swift

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

# Add flutterSDK
export PATH="$PATH:~/flutterSDK/flutter/bin"

# Cabal
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Ruby
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
