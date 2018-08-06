# Super duper helpers to put dir in path at specified pos only if it exists overwriting current PATH occurance
function put_path_front {
  [[ ":$PATH:" == *":$1:"* ]] && PATH="${PATH//$1:/}"
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
  fi
}

function put_path_back {
  [[ ":$PATH:" == *":$1:"* ]] && PATH="${PATH//:$1/}"
  if [ -d "$1" ]; then
    export PATH="$PATH:$1";
  fi
}

put_path_back "/usr/local/sbin"
put_path_back "/usr/local/bin"
put_path_back "/usr/sbin"
put_path_back "/usr/bin"
put_path_back "/sbin"
put_path_back "/bin"
put_path_back "/opt/X11/bin"
put_path_back "/usr/local/MacGPG2/bin"
put_path_back "/Library/TeX/texbin"
put_path_back "/Library/Frameworks/Mono.framework/Versions/Current/bin/"

put_path_back "$HOME/.bin/"
put_path_back "$HOME/bin/"

export LSCOLORS=exfxcxdxbxegedabagacad
alias ls='ls -GFh'
export CLICOLOR=1

export EDITOR='vim'

if [ -z $LANGUAGE ]; then
  export LANGUAGE="en_US.UTF-8"
fi
if [ -z $LANG ]; then
 export LANG="en_US.UTF-8"
fi
if [ -z $LC_ALL ]; then
  export LC_ALL="en_US.UTF-8"
fi

export PGDATA=/usr/local/var/postgres
