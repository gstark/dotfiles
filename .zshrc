# screw LS colors
# export DISABLE_LS_COLORS=true

# Case sensitive zsh completions
CASE_SENSITIVE="true"

# Disable ZSH's automatic update
DISABLE_AUTO_UPDATE=true

# Path to your oh-my-zsh installation.
export ZSH=$(realpath ~/.oh-my-zsh)

source $ZSH/oh-my-zsh.sh

#-------------------------------------------
# Homebrew environment
#-------------------------------------------
BREW_PREFIX=$(brew --prefix)

#-------------------------------------------
# Antigen plugin installer
#-------------------------------------------
source ~/bin/antigen.zsh
antigen use oh-my-zsh
antigen bundle aws
antigen bundle git
antigen bundle rake
antigen bundle ruby
antigen bundle colorize
antigen bundle z
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git-completion
antigen bundle popstas/zsh-command-time
antigen bundle joshskidmore/zsh-fzf-history-search
antigen bundle Aloxaf/fzf-tab
antigen theme minimal
antigen apply

#-------------------------------------------
# You may need to manually set your language environment
#-------------------------------------------
export LANG=en_US.UTF-8

#-------------------------------------------
# Set my editors to vim
#-------------------------------------------
export EDITOR='vim'
export VISUAL='vim'

#-------------------------------------------
# Some useful aliases
#-------------------------------------------
alias vi=vim
alias git=hub
alias issues="gh issue list -a gstark --web"
alias rm="if [ -x $BREW_PREFIX/bin/figlet ]; then figlet -f banner3 'use trash'; else; echo 'use trash'; fi #"
alias kspring='ps auxww | grep "[s]pring" | awk "{print \$2}" | xargs kill -9'
alias flushdns="dscacheutil -flushcache"
alias find_broken_symlinks='find . -type l | (while read FN ; do test -e "${FN}" || ls -ld "${FN}" ; done)'
alias gem_remove_all='gem list | grep -E -v "bundler|openssl|bigdecimal|json|rake|minitest|io-console|rdoc|psych|test-unit" | xargs gem uninstall --all --force'
alias gem_remove_all='gem list | grep -E -v "bundler|openssl|bigdecimal|json|rake|minitest|io-console|rdoc|psych|power_assert|test-unit|net-telnet|did_you_mean|xmlrpc" | xargs gem uninstall --all --force'
alias gem_remove_all='gem list | grep -E -v "default:|test-unit|power_assert|rake|net-telnet|did_you_mean|minitest" | awk "{print \$1}" | xargs gem uninstall --all --force'
alias tmux="TERM=screen-256color-bce tmux"
alias ack="rg"   # rg is faster and better
alias ag="rg"    # rg is faster and better
alias dockercd="cd ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux"
# MP4Box $(find . -name recent-front\* -type f ! -size 0 | awk '{ print "-cat " $1}') ~/Desktop/cam.mp4
ruboblame() {
  rubocop --format clang | grep -v '^\s' | grep -v '^$' | grep -v "files inspected" | awk -F: '{ cmd = "git blame --porcelain -L "$2","$2 " " $1 " 2>/dev/null | grep \"^author \" | cut -c8-"; cmd | getline blame; print blame ": " $1 " Line:" $2 " " $5 " " $6; close(cmd) }'
}
# Catch a common scp mistake.
scp() {
  if [[ "$@" =~ : ]]; then
    /usr/bin/scp $@
  else
    echo 'You forgot the colon!'
  fi
}

#-------------------------------------------
# EC2
#-------------------------------------------
export EC2_HOME=~/.ec2
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem 2>/dev/null`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem 2>/dev/null`

#-------------------------------------------
# Prompt
#-------------------------------------------
# configure_prompt()
# {
#   autoload -U colors && colors
#   function echo_blank() {
#       echo
#   }
#   precmd_functions+=echo_blank
#
#   animate_if_error()
#   {
#     if [[ $? -ne 0 ]]; then
#       PROMPT=""
#       STATUS_COLOR="%F{red}"
#     else
#       PROMPT=""
#       STATUS_COLOR="%F{green}"
#     fi
#     PROMPT="${PROMPT}%F${STATUS_COLOR}%~%F{white}
# $ "
#   }
#
#   precmd_functions+=animate_if_error
# }

#-------------------------------------------
# Define the shell prompt
#-------------------------------------------
# unstaged (*) and staged (+) changes will be shown next to the branch name
export GIT_PS1_SHOWDIRTYSTATE="true"
# see if there're untracked files
export GIT_PS1_SHOWUNTRACKEDFILES="true"
# see the difference between HEAD and its upstream
export GIT_PS1_SHOWUPSTREAM="true"
export PROMPT="%~ \$(vcs_status)»%b "

#-------------------------------------------
# Compiler Settings
#-------------------------------------------
# Tell any compiler we want only the 64-bit x86 binaries
#export ARCHFLAGS="-arch x86_64"

#-------------------------------------------
# Disable brew auto update
#-------------------------------------------
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_AUTO_UPDATE_SECS=90000000
# export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

#-------------------------------------------
# Key bindings
#-------------------------------------------
bindkey '^b' backward-word
bindkey '^f' forward-word

#-------------------------------------------
# iTerm shell integration
#-------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#-------------------------------------------
# Disable rails' spring command
#-------------------------------------------
DISABLE_SPRING=true

#-------------------------------------------
# chruby
#-------------------------------------------
if [ -f $BREW_PREFIX/share/chruby/chruby.sh ]; then
  source $BREW_PREFIX/share/chruby/chruby.sh
fi
if [ -f $BREW_PREFIX/share/chruby/auto.sh ]; then
  source $BREW_PREFIX/share/chruby/auto.sh
fi

#-------------------------------------------
# nodenv
#-------------------------------------------
# eval "$(nodenv init -)"

#-------------------------------------------
# FZF
#-------------------------------------------
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

#-------------------------------------------
# OAUTH keys
#-------------------------------------------
if [ -f ~/.oauth_keys ]; then
  . ~/.oauth_keys
fi

#-------------------------------------------
# ripgrep
#-------------------------------------------
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

#-------------------------------------------
# PATH configuration
#-------------------------------------------
export PATH="$BREW_PREFIX/bin:$HOME/bin:$BREW_PREFIX/sbin:${PATH}"

#-------------------------------------------
# Put the local `bin` path before the global path
#-------------------------------------------
export PATH="./bin:${PATH}"

#-------------------------------------------
# YARN
#-------------------------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#-------------------------------------------
# Add path for 'go'
#-------------------------------------------
export PATH="$HOME/go/bin:$PATH"

#-------------------------------------------
# Fix slow pasting into zsh when syntax highligting is on
#-------------------------------------------
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

#-------------------------------------------
# dotnet
#-------------------------------------------
export ASPNETCORE_ENVIRONMENT=Development

#-------------------------------------------
# less
#-------------------------------------------
# Remove options from less
unset LESS

# Disable control-D (EOF) from existing the shell
setopt ignore_eof

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '~/.netlify/helper/path.zsh.inc' ]; then source '~/.netlify/helper/path.zsh.inc'; fi

# Configures the ZSH command timing to exclude certain commands
ZSH_COMMAND_TIME_EXCLUDE=(vim irb)

#-------------------------------------------
# the fuck
#-------------------------------------------
eval $(thefuck --alias)

#-------------------------------------------
# Ignore history duplicates
#-------------------------------------------
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

#-------------------------------------------
# asdf
#-------------------------------------------
if [ -f /usr/local/opt/asdf/libexec/asdf.sh ]; then
  . /usr/local/opt/asdf/libexec/asdf.sh
fi


#-------------------------------------------
# hivemind: https://github.com/DarthSim/hivemind
#-------------------------------------------
export HIVEMIND_PORT=3000
