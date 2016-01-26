# Path to your oh-my-zsh installation.
export ZSH=/Users/tristandruyen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"

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
plugins=(git battery autojump bundler osx rails brew rbenv zsh-syntax-highlighting zsh-dwim)

# User configuration#####################

#Disable RPROMPT cause i set it manually
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#Double lined Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#Default User to hide beginning
export DEFAULT_USER="tristandruyen"

#Shorten Dir lenght
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

#Rbenv
#eval "$(direnv hook bash)"
export PATH="/usr/local/heroku/bin:/Users/tristandruyen/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin"

export PATH="$HOME/.bin:$PATH"
eval "$(direnv hook zsh)"
eval "$(rbenv init - --no-rehash zsh)"
#eval "$(docker-machine env dev)"

#NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#oh my zsh###############################
source $ZSH/oh-my-zsh.sh

#LS Colors
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls='ls -GFh'
export CLICOLOR=1

#CUSTOM THEME

function ruby_version()
{
  if which rvm-prompt &> /dev/null; then
    rvm-prompt i v g
  else
    if which rbenv &> /dev/null; then
      rbenv version | sed -e "s/ (set.*$//"
    fi
  fi
}

function ruby_version2()
{
  ruby --version | ag "\s(\d.{1}\d.{1}\d)" -o -m 1 --silent
}

function batcharge2(){
battery_level_gauge
}

function batcharge {
  echo `python ~/bin/batcharge.py` 2>/dev/null
}

RPROMPT_PREFIX='%{'$'\e[1A''%}' # one line up
RPROMPT_SUFFIX='%{'$'\e[1B''%}' # one line down
RPROMPT=$RPROMPT_PREFIX'$(batcharge2) $(ruby_version2)'$RPROMPT_SUFFIX

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
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

#internal and external ip
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias rk='rake'
alias rt='echo use rk instead'
alias gca='git add -A && git commit -a'
alias gcam='git add -A && git commit -am'
alias cd-='cd ~'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
