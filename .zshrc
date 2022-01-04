# screw LS colors
# export DISABLE_LS_COLORS=true

# Case sensitive zsh completions
CASE_SENSITIVE="true"

# Disable ZSH's automatic update
DISABLE_AUTO_UPDATE=true

# Path to your oh-my-zsh installation.
export ZSH=/Users/gavin/.oh-my-zsh

#-------------------------------------------
# Antigen plugin installer
#-------------------------------------------
source ~/bin/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle rake
antigen bundle ruby
antigen bundle colorize
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle popstas/zsh-command-time
antigen theme minimal
antigen apply

ZSH_THEME=minimal
source $ZSH/oh-my-zsh.sh


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
alias rm="if [ -x /usr/local/bin/figlet ]; then figlet -f banner3 'use trash'; else; echo 'use trash'; fi #"
alias find_broken_symlinks='find . -type l | (while read FN ; do test -e "${FN}" || ls -ld "${FN}" ; done)'
alias gem_remove_all='gem list | grep -E -v "bundler|openssl|bigdecimal|json|rake|minitest|io-console|rdoc|psych|test-unit" | xargs gem uninstall --all --force'
alias gem_remove_all='gem list | grep -E -v "bundler|openssl|bigdecimal|json|rake|minitest|io-console|rdoc|psych|power_assert|test-unit|net-telnet|did_you_mean|xmlrpc" | xargs gem uninstall --all --force'
alias gem_remove_all='gem list | grep -E -v "default:|test-unit|power_assert|rake|net-telnet|did_you_mean|minitest" | awk "{print \$1}" | xargs gem uninstall --all --force'
alias tmux="TERM=screen-256color-bce tmux"
alias ack="rg"   # rg is faster and better
alias ag="rg"    # rg is faster and better
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
# Tracks yadm status (dotfiles)
#-------------------------------------------
yadm_status() {
  if [ -n "$(yadm status --porcelain)" ]; then
    #echo "${fg[red]}(yadm)${reset_color} "
    echo "(yadm) "
  else
    echo ""
  fi
}

#-------------------------------------------
# Define the shell prompt
#-------------------------------------------
# unstaged (*) and staged (+) changes will be shown next to the branch name
export GIT_PS1_SHOWDIRTYSTATE="true"
# see if there're untracked files
export GIT_PS1_SHOWUNTRACKEDFILES="true"
# see the difference between HEAD and its upstream
export GIT_PS1_SHOWUPSTREAM="true"
export PROMPT="%~ \$(vcs_status)\$(yadm_status)»%b "

#-------------------------------------------
# Disable brew auto update
#-------------------------------------------
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_AUTO_UPDATE_SECS=90000000

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
# FZF
#-------------------------------------------
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

#-------------------------------------------
# ripgrep
#-------------------------------------------
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

#-------------------------------------------
# PATH configuration
#-------------------------------------------
#export PATH="/usr/local/bin:$HOME/bin:/usr/local/sbin:${PATH}"

#-------------------------------------------
# Fix slow pasting into zsh when syntax highligting is on
#-------------------------------------------
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Remove options from less
#
unset LESS

# Disable control-D (EOF) from existing the shell
setopt ignore_eof

# Configures the ZSH command timing to exclude certain commands
ZSH_COMMAND_TIME_EXCLUDE=(vim irb)

#-------------------------------------------
# RBENV
#-------------------------------------------
eval "$(rbenv init -)"

#-------------------------------------------
# Because node is old NODE
#-------------------------------------------
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/node@14/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/node@14/include"





