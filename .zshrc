## PATH ########################################################################

if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval "$(pyenv init --path)"
    export PATH="$HOME/.pyenv/bin:$PATH"
    export PATH="$PATH:/Users/akira/flutter/bin"
    export PATH="/usr/local/opt/openssl@3/bin:$PATH"

    # qmk
    export DYLD_LIBRARY_PATH=/opt/homebrew/Cellar/libtiff/4.6.0/lib:$DYLD_LIBRARY_PATH

elif [[ "$(uname)" == "Linux" ]]; then
    export PATH=$PATH:~/.local/bin

fi

## SSH #########################################################################
ssh-add ~/.ssh/id_rsa_42


## LOAD ########################################################################
# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# git-prompt
source ~/.zsh/git-prompt.sh

# git-completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# option
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto


## SETOPT ######################################################################
# prompt
setopt PROMPT_SUBST ; PS1='%F{green}takira [$status] %f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '
#setopt PROMPT_SUBST ; PS1='%F{green}takira %f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
#\$ '

# ignore ^D
setopt IGNOREEOF


## TRASH-CLI ###################################################################
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

# run docker engine
#if ! colima status > /dev/null 2>&1; then
#    colima start
#fi

## ALIAS #######################################################################
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
