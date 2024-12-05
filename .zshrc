# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
  git
  zsh-autosuggestions
  emoji
  fzf
  autodotenv
)

export AUTODOTENV_SKIP_CONFIRM=true

source $ZSH/oh-my-zsh.sh
export PATH="$PATH:/opt/nvim-linux64/bin"
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases
alias ls="exa --icons -l"
alias la="exa --icons -la --git"
alias ll="exa --icons -l --git"
alias bun="~/.bun/bin/bun"
alias bunx="~/.bun/bin/bunx"
alias cat="batcat --style=plain --theme ansi"
alias fd="fd-find"
alias tp="trash-put"
alias nn="nnn -ioeH"
alias lg="lazygit"
alias zl="zellij"
alias n="nvim"
alias nvm-lts="source ~/.nvm/nvm.sh --no-use && nvm use --lts"
alias td="todo.sh -t"

# Functions
function nvm() {
    source ~/.nvm/nvm.sh --no-use
    nvm "$@"
}

export EDITOR=nvim

function tm() {
    local session_name=$(basename "$(pwd)")
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Tmux session '$session_name' already exists."
    else
        tmux new-session -s "$session_name"
    fi
}

function tt() {
    local session_name="$1"
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        echo "Tmux session '$session_name' does not exist."
    fi
}

function zln() {
    local session_name=$(basename "$(pwd)")
    if ! zellij list-sessions | grep -w "$session_name" >/dev/null; then
        echo "Session '$session_name' does not exist. Creating a new session..."
        zellij --layout noob attach --create "$session_name"
    else
        echo "Session '$session_name' already exists."
    fi
}

alias zla="zellij --layout noob attach"
alias zl="zl --layout noob"

function nz() {
    nvim "$(fzf)"
}

# PATH settings
export PATH="/home/noobscience/.bin:$PATH"
export PATH="/home/noobscience/go/bin:$PATH"
# export PATH="/home/noobscience/.applications/zig-linux-x86_64-0.14.0-dev.611+f2bf6c1b1:$PATH"
export PATH="/home/noobscience/.applications/zig-linux-x86_64-0.13.0:$PATH"
export PATH="/home/noobscience/.applications/clion-2024.1.2/bin:$PATH"
export PATH="/home/noobscience/.cargo/bin:$PATH"
export PATH="/home/noobscience/.applications/bflat-8.0.2-linux-glibc-x64:$PATH"
export PATH="/home/noobscience/.bun/bin:$PATH"
export BW_SESSION="69LlIqSUErtCXwpflmdL62w3oGwfgVU0tcB/dqMNE9Bz2yF8Vbh4z5cNI/F0SyLHHD5BWZCMv3YuKksWSvmjLA==" 
export PATH="/home/noobscience/.local/bin:$PATH"

# Initialize zoxide
eval "$(zoxide init zsh)"

# Initialize asdf
source ~/.asdf/asdf.sh

nerdfetch 
todo.sh lsp A-B

# Warp integration (commented out)
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

function sel() {
    local dir=$1
    if [[ -z $dir ]]; then
        dir="."
    fi

    local target=$(ls -1 "$dir" | fzf)
    
    if [[ -z $target ]]; then
        echo "No selection made."
        return
    fi

    if [[ -d "$dir/$target" ]]; then
        cd "$dir/$target"
    elif [[ -f "$dir/$target" ]]; then
        $EDITOR "$dir/$target"
    else
        echo "$target is neither a file nor a directory."
    fi
}

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () { 
  if [ -z "$1" ]; then
    zellij pipe;
  else 
    zellij pipe -p $1;
  fi
}
