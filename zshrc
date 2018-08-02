# Path to your oh-my-zsh installation.
export ZSH=/Users/tristandruyen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git battery last-working-dir autojump bundler osx brew zsh-syntax-highlighting zsh-autosuggestions)

#PLUGINS:###########
#-GIT
#-WEB-SEARCH
#-BATTERY GAUGE
#-LAST WORJUBG DIRECTORY
#-AUTOJUMP
#-BUNDLER
#-OSX
#-RAILS
#-BREW
#-RBENV
#-ZSH-SYNTAX-HIGHLIGHTING
#-ZSH-DWIM
#
# User configuration#####################

#CUSTOM THEME
RPROMPT_PREFIX='%{'$'\e[1A''%}' # lineup
RPROMPT_SUFFIX='%{'$'\e[1B''%}' # linedown
RPROMPT=$RPROMPT_PREFIX'$(batcharge2) '$RPROMPT_SUFFIX

#Disable RPROMPT cause i set it manually
# POWERLEVEL9K_DISABLE_RPROMPT=true

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# #Double lined Prompt
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#Default User to hide beginning
export DEFAULT_USER="tristandruyen"

#Shorten Dir lenght
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# Hub github stuff
# eval "$(hub alias -s)"
     
#oh my zsh###############################
source $ZSH/oh-my-zsh.sh


# goolge cloud sdk
. '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
. '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# You may need to manually set your language environment

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


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

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=( "$HOME/.zfunctions" $fpath )

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

eval "$(direnv hook zsh)"

autoload -U promptinit; promptinit
prompt purity
