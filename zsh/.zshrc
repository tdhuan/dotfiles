# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/huantd/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

ZSH_THEME="powerlevel10k/powerlevel10k"

DEFAULT_USER="huantd"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
prompt_context () { }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.local/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH=~/.npm-global/bin:$PATH

export PATH=/opt/lua-5.4.0/src:$PATH

export TOKEN="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"

alias dotfiles="cd ~/dotfiles"
alias dt="cd ~/Desktop"
alias neovim="cd ~/dotfiles/nvim"
alias cdzsh="cd ~/dotfiles/zsh"

alias learning="cd /Volumes/E/learning"
alias threejs="cd /Volumes/E/learning/threejs"

alias training="cd /Volumes/E/training"
alias workspace="cd /Volumes/E/workspace"
alias testing="cd /Volumes/E/testing"

alias be="bundle exec"
alias ber="bundle exec rails"
alias berdmg="bunlde exec rails db:migrate"
alias berg="bundle exec rails generate"
alias bergm="bundle exec rails generate migration"
alias bergm="bundle exec rails generate model"
alias bergc="bundle exec rails generate controller"

#quick access project Camelo
alias calm-app="cd ~/Desktop/camelo/mobile"
alias calm-be="cd ~/Desktop/camelo/services/sahara"
alias calm-web="cd ~/Desktop/camelo/webapp"
alias kiosk="cd ~/Desktop/camelo/kiosk"
alias homepage="cd ~/Desktop/camelo/new-homepage"
alias melange="cd ~/Desktop/melange"
alias calmp="open https://github.com/camelohq/camelo/pull"
alias ys="yarn storybook"
alias calm-mail="~/Desktop/camelo/services/delivery_boy"
alias start-mail="bundle exec ruby app.rb"


# yarn | npm
alias yd="yarn dev"
alias ystart="yarn start"
alias nstart="npm start"
alias ya="yarn add"
alias yad="yarn add -D"

# run python code
alias py3="python3"

alias udemy-test="cd ~/Desktop/learn-jest/udemy-NEXTJS-TESTING"
alias blue="cd /Volumes/E/learning/bigo-blue"

#quick acess neovim config
alias cd-nvim="cd ~/.config/nvim"

#quick call lazygit
alias lz="lazygit"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# ---- Start Config for bat https://github.com/sharkdp/bat ----
export BAT_THEME='gruvbox-dark'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Highlighting --help message | https://github.com/sharkdp/bat#highlighting---help-messages
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
# ---- End Config for bat https://github.com/sharkdp/bat ----
