############################ ZPLUG
source $HOME/.zplug/init.zsh

# General
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "djui/alias-tips"
zplug "mafredri/zsh-async", from:github, defer:0

# Libs
zplug "lib/functions", from:oh-my-zsh, defer:0
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh

# Oh My Zsh Plugins
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "intelfx/pure", use:pure.zsh, from:github, as:theme

# Custom Plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "tarruda/zsh-autosuggestions", use:"dist/autosuggestions.zsh"


# install/update
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# User configuration#####################
PURE_PROMPT_SYMBOL='❯'
PURE_GIT_DOWN_ARROW='↓'
PURE_GIT_UP_ARROW='↑'
RPROMPT='❮%F{grey}%*'
PROMPT='%(?.${PURE_PROMPT_SYMBOL}.%F{red}✖)%f '

autoload -U promptinit; promptinit

_prompt_hostname() {
  preprompt+=( "%F{red} $(hostname -s) %f" )
}

prompt pure
# add the generator where it's needed
prompt_pure_pieces=(
  # _prompt_hostname
  ${prompt_pure_pieces:0}
)

#########################################
# Misc###################################

export DEFAULT_USER="tristandruyen"


# Hub github stuff
# eval "$(hub alias -s)"

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
##################
# direnv
eval "$(direnv hook zsh)"
#########################################



# Aliases########################################


alias ccat='pygmentize -g -O style=colorful'
#internal and external ip
alias globalip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias lockscr='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias rk='rake'
alias rt='echo use rk instead'
alias gc='git commit -S'
alias gca='git add -A && git commit -S -a'
alias gcam='git add -A && git commit -S -am'
alias cd-='cd ~'
alias tag='ctags -R .'
alias ydl='youtube-dl'
alias ec='emacsclient'
alias ra='rubocop -a'
function dcuc {
  docker-compose pull $1 && docker-compose up -d --build $1
}

function searep {
  find . -name '*.ex' -print -exec sed -i '' 's/${$1}/${$2}/g' {} \;
}

# fpath=(/usr/local/share/zsh-completions $fpath)
# fpath=( "$HOME/.zfunctions" $fpath )

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
