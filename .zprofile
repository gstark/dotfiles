#-------------------------------------------
# Homebrew environment
#-------------------------------------------
BREW_PREFIX=$(brew --prefix)

#-------------------------------------------
# chruby
#-------------------------------------------
if [ -f $BREW_PREFIX/share/chruby/chruby.sh ]; then
  source $BREW_PREFIX/share/chruby/chruby.sh
fi
if [ -f $BREW_PREFIX/share/chruby/auto.sh ]; then
  source $BREW_PREFIX/share/chruby/auto.sh
fi

chruby_auto

