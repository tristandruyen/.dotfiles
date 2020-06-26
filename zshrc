# #
# source ~/.zshenv
# ZPLUG ########################################################################
#
source /usr/share/zsh/scripts/zplug/init.zsh
#
# INIT #######
# source ~/.zplug/init.zsh

# PLUGINS ##################################################
########################################
# General
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "djui/alias-tips"
zplug "mafredri/zsh-async", from:github, defer:0
########################################
# Libs
zplug "lib/functions", from:oh-my-zsh, defer:0
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
########################################
# Oh My Zsh Plugins
zplug "gusaiani/elixir-oh-my-zsh"
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
# zplug "oknowton/zsh-dwim", from:github, defer:1

########################################
# Theme
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
#oi 
# zplug "intelfx/pure", use:pure.zsh, from:github, as:theme
########################################
# Custom Plugins
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "tarruda/zsh-autosuggestions", use:"dist/autosuggestions.zsh"
############################################################
# INSTALL/UPDATE ###########################################
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
#
zplug load
################################################################################
# User prompt configuration#####################################################
#
#
SPACESHIP_DOCKER_SHOW=false
PURE_PROMPT_SYMBOL='❯'
PURE_GIT_DOWN_ARROW='↓'
PURE_GIT_UP_ARROW='↑'
RPROMPT='❮%F{grey}%*'
PROMPT='%(?.${PURE_PROMPT_SYMBOL}.%F{red}✖)%f '

autoload -U promptinit; promptinit

_prompt_hostname() {
  preprompt+=( "%F{red} $(hostname -s) %f" )
}

# prompt pure
#
# prompt_pure_pieces=(
#   _prompt_hostname
#   ${prompt_pure_pieces:0}
# )
#
################################################################################
# Misc##########################################################################
export DEFAULT_USER="tristandruyen"
# gcloud sdk#######
if [ -d '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/' ]; then
  . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi
###################
# asdf
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
export ASDFROOT=$HOME/.asdf
export ASDFINSTALLS=$HOME/.asdf/installs
##################
# GO
GOV=$(asdf current golang | sed "s/[[:blank:]]*(set by .*)//g")
export GO111MODULE=on
# export GOROOT=$ASDFINSTALLS/golang/$GOV/go/
##################
# direnv

if [ $(type direnv >/dev/null 2>&1) ]; then
  eval "$(direnv hook zsh)"
fi
##################

# Hub github stuff
# eval "$(hub alias -s)"

##################
# graalvm
if [ -d $HOME/mycellar/graalvm ]; then
  export GRAALVM_HOME=$HOME/mycellar/graalvm
fi
################################################################################
# Aliases#######################################################################
#
#
# TMUX

alias tmx="tmux attach || tmux new"
# PACMAN
alias pacsize='expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort)) | sort -n'

# CHEAT
function cheat() {
    curl cht.sh/$1
}

# Transfer.sh
transfer() {
    # helptext
    if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    # rest
    tmpfile=$( mktemp -t transferXXX );
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile; rm -f $tmpfile;
}

# cat with syntax highlighting
alias ccat='pygmentize -g -O style=colorful'
# internal and external ip
alias globalip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ls=exa
alias la="ls -la"

# osx lockscr
alias lockscr='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias lscr=lockscr
alias lock=lockscr

# extra rake/ruby
alias rk='rake'
alias rt='echo use rk instead'
alias ra='rubocop -a'
alias rark='ra && rk'

# extra git
# alias commit='commit -S'
alias gca='git add -A && git commit -a'
alias gcadd='git commit -a'
alias gcam='git add -A && git commit -am'

# extra miscs
# alias cd-='cd ~'
alias tag='ctags -R .'
alias ydl='youtube-dl'
alias mip='sudo ifconfig lo0 alias 192.168.100.1'
# EMACS RULES
alias ec='emacsclient'
alias ect='emacsclient -t'
# vi()
#   {
#       emacs -nw --eval '(and (switch-to-buffer "foobar") (setq viper-mode t) (setq viper-inhibit-startup-message t) (setq viper-expert-level 1) (viper-mode))' "$@"
#   }

# alias vim=vi
# alias vim.tiny=vi
# alias vim.basic=vi

# alias functions
function dcuc {
  docker-compose pull ${@:1} && docker-compose up -d --build ${@:1}

}

function do_until_fail {
  while [ $? -eq 0 ]; do; eval $1; done
}

function searep {
  find . -name '*.ex' -print -exec sed -i '' 's/${$1}/${$2}/g' {} \;
}

function make_rel {
  echo "Building quay.io/invisionag/${PWD##*/}"
  docker-compose build --pull
  docker-compose run app &&
  docker-compose down -v --remove-orphans
  docker build "quay.io/invisionag/${PWD##*/}", "-f Dockerfile.release --pull ."
}
################################################################################

function lie {
  if [[ "$1" == "not" ]]
  then
    unset GIT_AUTHOR_DATE
    unset GIT_COMMITTER_DATE
    return 0
  fi
  export GIT_AUTHOR_DATE="$1"
  export export GIT_COMMITTER_DATE="$1"
}
alias datestring='date +"%Y%m%d%H%M%S"'
function multibox {
    for var in "$@"
    do
        soundbox $var &
    done
}

function fullpath { echo $(pwd)/$1 }

alias clown='soundbox 6'
alias ohrenkrebs="soundbox 1 & soundbox 2 & soundbox 3 & soundbox 0 & soundbox 4 & soundbox 5 & soundbox 9 & soundbox 10 & soundbox 11 & soundbox 12 & soundbox 13 & soundbox 14 & soundbox 15 & soundbox 16 & soundbox 17 & soundbox 18 & soundbox 19"
# if [ -z $TMUX ]; then
#   tmux
# fi

# Function to switch and save the current path

# function cd() {
#   builtin cd "$@";
#   if [ $PWD != "/Users/tristandruyen" ]; then
#     echo "$PWD" > ~/.cwd;
#   fi
# }
# export cd
# alias cwd='cd $(cat ~/.cwd)'
# cwd
