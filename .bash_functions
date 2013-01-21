function test {
  balls[0]="one"
  balls[1]="two"
  i=`expr ${#balls[@]} - 1`
  echo ${i}
  echo ${balls[${i}]}
}

function d {
  cd ~/Development

  if [ ! -z "$1" ]; then
    cd $1
  fi
}

function gd {
  if [ ! -z "$1" ] && [ ! -z "$2" ]; then
      git difftool -y "$1" "$2"
  else
      git difftool -y
  fi
}

function gs {
  if [ ! -z "$1" ]; then
      rbenv-gemset "$1"
  else
      rbenv-gemset active
  fi
}

function list {
  if [ ! -z "$1" ]; then
    tree -aLC "$1"
  else
    tree -aLC 2
  fi
}

function mou {
  if [ ! -z "$1" ]; then
    open "$1" -a Mou
  else
    open -a Mou
  fi
}

function offline {
  if [ ! -z "$1" ] && [ ! -z "$2" ]; then
    if [ ! -d "~/Development/offline/$1" ]; then
      mkdir -p ~/Development/offline/"$1"
    fi

    cd ~/Development/offline/"$1"
    wget -rkp -l10 -np -nH "$2"
  else
    echo "Usage: offline example http://example.com"
  fi
}

function pull {
  if [ ! -z "$1" ]; then
    git pull origin "$1"
  else
    git pull origin master
  fi
}

function push {
  if [ ! -z "$1" ]; then
    git push origin "$1"
  else
    git push origin master
  fi
}

function rs {
  if [ ! -z "$1" ]; then
    rspec spec/"$1"_spec.rb
  else
    rspec spec
  fi
}

function s {
  if [ ! -z "$1" ]; then
    open "$1" -a "Sublime Text 2"
  else
    open "./" -a "Sublime Text 2"
  fi
}

function badtouch {
  if [ ! -f "$1" ]; then
    touch $1
  fi
}

function md {
  if [ ! -z "$1" ]; then
    mkdir $1
    echo "created ./${1}/"
  else
    echo "You derped and didn't give a directory name. "
    echo "Since I'm a better program than you are a programmer, I'll just go ahead and ask you. "
    echo "What the fuck directory do you want me to create?"
    read dir_name
    mkdir $dir_name
    echo "created ./${dir_name}/"
  fi
}

function pr {
  local dir="$PWD"

  until [[ -z "$dir" ]]; do
    if [ -d ./.git ]; then
      break
    else
      cd ..
    fi
    dir="${dir%/*}"
  done
}

function example {
  echo "\$# = $# (argument count)"
  echo "\$@ = $@ (arguments)"
  echo
  echo '$*';
  for p in $*;
  do
      echo "  [$p]";
  done;
  echo '"$*"';
  for p in "$*";
  do
      echo "  [$p]";
  done;
  echo '$@';
  for p in $@;
  do
      echo "  [$p]";
  done;
  echo '"$@"';
  for p in "$@";
  do
      echo "  [$p]";
  done

  echo
  echo ----- String tests

  if [ -z "$1" ]; then
    echo 'First argument is an empty string'
  fi

  if [ -n "$1" ]; then
    echo 'First argument is a non-empty string'
  fi

  if [ "a" == "a" ]; then
    echo '"a" == "a"'
  fi

  if [ "a" != "b" ]; then
    echo '"a" != "b"'
  fi

  if [ "b" > "a" ]; then
    echo '"b" > "a"'
  fi

  echo
  echo ----- File tests

  if [ -a ~/.bash_functions ] || [ -e ~/.bash_functions ]; then
    echo '-a, -e (~/.bash_functions exists)'
  fi

  if [ -f ~/.bash_functions ]; then
    echo '-f (~/.bash_functions exists and is a file)'
  fi

  if [ -h ~/.bash_functions ] || [ -L ~/.bash_functions ]; then
    echo '-h, -L (~/.bash_functions exists and is a symbolic link)'
  fi

  if [ -r ~/.bash_functions ]; then
    echo '-r (~/.bash_functions exists and is readable)'
  fi

  if [ -w ~/.bash_functions ]; then
    echo '-w (~/.bash_functions exists and is writeable)'
  fi

  if [ -O ~/.bash_functions ]; then
    echo '-O (~/.bash_functions exists and is owned by current user)'
  fi

  if [ -x $SHELL ]; then
    echo "-x ($SHELL exists and is executable)"
  fi

  echo
  echo ----- Directory tests

  if [ -d $HOME ]; then
    echo "$HOME exists and is a directory"
  fi

}

function loop {
  for i in 1 2 3 4 5
  do
     echo  -ne "$i"
  done
  echo
}

function nx {
  if [ -n "$1" ]; then
    if [ "$1" == "start" ]; then
      `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist` && echo "nginx started"
    fi

    if [ "$1" == "restart" ]; then
      `launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist` &&  `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist` && echo "nginx restarted"
    fi

    if [ "$1" == "stop" ]; then
      `launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist` && echo "nginx stopped"
    fi

  fi
}