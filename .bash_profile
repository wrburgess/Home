export PATH="$PATH:/usr/local/android-sdk-macosx/tools"
export PATH="$PATH:/usr/local/android-sdk-macosx/platform-tools"
export PATH="$PATH:/usr/local/share/python"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR="/usr/local/bin/subl"
export TERM_EDITOR="/usr/bin/vim"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Include git completion
if [ -f ~/.git-completion.sh ]
  then
   source ~/.git-completion.sh
fi

# Include alias file
if [ -f ~/.aliases ]
  then
   source ~/.aliases
fi

# Include functions file
if [ -f ~/.bash_functions ]
  then
   source ~/.bash_functions
fi

# Include colors file
if [ -f ~/.colors ]
  then
   source ~/.colors
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Prompt
prompt="$green\w:$end "
# Current git branch (if any)
git_branch="$yellow\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1)')\"\`$end"
# RVM version and gemset
rvm="$turquoise(\$(~/.rvm/bin/rvm-prompt))$end"

PS1="$prompt"
PS1="$rvm $git_branch $prompt"
PS2='\[\e[0;33m\]> \[\e[0m\]'

# Make bash check it's window size after a process completes
shopt -s checkwinsize

# Welcome Message

#Groupon stuff
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000
