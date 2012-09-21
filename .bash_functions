d () {
  cd ~/Development

  if [ ! -z "$1" ]; then
    cd $1
  fi

}

rs () {
  if [ ! -z "$1" ]; then
    rspec spec/"$1"_spec.rb
  else
    rspec spec
  fi
}

use () {
  if [ ! -z "$1" ]; then
    rvm use "$1"
  fi
}

rebundle () {
  if [ ! -z "$1" ]; then
    if [ -f "Gemfile.lock" ]; then
      rm -Rf Gemfile.lock
    fi
    rvm --force gemset delete "$1"
    rvm gemset create "$1"
    rvm gemset use "$1"
    bundle
  fi
}

base () {
  if [ -z "$1" ]; then
    open db/development.sqlite3 -a Base
  else
    open "$1" -a Base
  fi
}

push () {
  if [ ! -z "$1" ]; then
    git push origin "$1"
  else
    git push origin master
  fi
}

pull () {
  if [ ! -z "$1" ]; then
    git pull origin "$1"
  else
    git pull origin master
  fi
}

switch () {
  if [ ! -z "$1" ]; then
    git checkout "$1"
  else
    echo "You must provide a branch to switch to! (switch <branch>)"
  fi
}

gd () {
  if [ ! -z "$1" ] && [ ! -z "$2" ]; then
      git difftool -y "$1" "$2"
  else
      git difftool -y
  fi
}

list () {
  if [ ! -z "$1" ]; then
    tree -aLC "$1"
  else
    tree -aLC 2
  fi
}

# Sublime shortcut
s () {
  if [ ! -z "$1" ]; then
    open "$1" -a "Sublime Text 2"
  else
    open "./" -a "Sublime Text 2"
  fi
}

mou () {
  if [ ! -z "$1" ]; then
    open "$1" -a Mou
  else
    open -a Mou
  fi
}