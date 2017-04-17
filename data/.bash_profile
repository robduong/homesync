# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export PATH=/usr/local/bin:$PATH
export EDITOR=nvim
export AWS_CLI=/usr/local/bin/aws

export rca=~/teams/rca
export grad=~/teams/grad
export prc=~/teams/property-core
export bui=~/teams/builders
export gia=~/teams/gia
export pops=~/teams/psw-ops
export other=~/teams/other

export fp=~/teams/fp-guild

eval "$(rbenv init - --no-rehash)"

# builder stream specific commands
source ~/.builder_profile

source /Users/robert.duong/git/saml-aws-functions/bash-functions

#AWS Account
MY_ACCOUNT=$(cut -d '/' -f 1 <<< $AWS_ROLE_SESSION_NAME)

#Prompt Colours
BLUE="\[\033[0;34m\]"
YELLOW="\[\033[1;33m\]"
#PINK="\033]01;31\]"
NO_COLOR="\[\033[0m\]"
SOME="\[\033[0;32m\]"

#PS1="$BLUE[Robert]${YELLOW}\w${NO_COLOR}$git_branch "
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="${SOME}\w ${NO_COLOR} $txtred\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] ${YELLOW} \$(cut -d '/' -f 1 <<< \$AWS_ROLE_SESSION_NAME) \n${SOME}$ ${NO_COLOR} "

#Postgres
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin

#Shush KMS encryption lives in here
PATH=$PATH:/Users/robert.duong/git

#setup git tab completion - local version
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#git log pretty tree
alias gitlog='git log --graph --full-history --all --color \
        --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"' 

catWithColor() {
  pygmentize -g $1
}

#syntax highlighting cat
alias catc=catWithColor

#git alias
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gcl='git clone'
alias gl='git pull'
alias gpom="git pull origin master"
alias gpum="git pull origin master"
alias gfo="git pull origin "
alias gp='git push'
alias gd='git diff | vi'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'
alias gf='git fetch'
alias grb='git rebase'
alias gh='git hist'
alias gdt='git difftool'

#use neovim
alias vim='nvim'
alias vi='nvim'

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add colors to man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

gcut() {
  grep $@ | tr '' '\n' | grep $@
}


#docker alias
alias dockerst='docker stop $(docker ps -a -q)'
alias dockerrma='docker rm $(docker ps -a -q)'

alias tmux="TERM=screen-256color-bce tmux"

#unused stuff
#PATH="/Users/robert.duong/.conscript/bin:$PATH"
#node.js management
#export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see #http://git.io/n-install-repo).

#vi mode controls
#set -o vi

#setup git tab completion - requires bash-completion
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#  if [ "$SHELL" == "/bin/bash"]; then
#   . `brew --prefix`/etc/bash_completion
#  fi
#fi
