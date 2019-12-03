# dotfiles
 
## Installation
```bash
$ git clone https://github.com/itzderr/dotfiles ~/dotfiles
$ cd dotfiles
$ bash install.sh
```

## bash-git-prompt config add the following in your .bash_profile
```
# bash-git-prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  export GIT_PROMPT_ONLY_IN_REPO=0
  export GIT_PROMPT_THEME=Solarized
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
```
