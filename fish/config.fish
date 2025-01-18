if status is-interactive
    # Commands to run in interactive sessions can go here
    #pokemon-go-colorscripts -r --no-title

    # /home/noobscience/.bin/nerdfetch
    #echo -e "\e[0m$(echo -e "\e[33mNoob is cool\e[0m" | cowsay -f apt)\e[0m"
    colorscript random
    set -g fish_greeting ""
end

alias ls "exa --icons"
alias la "exa --icons -la --git"
alias ll "exa --icons -l --git"
alias lt "exa --icons --tree --git"
alias bun "~/.bun/bin/bun"
alias bunx "~/.bun/bin/bunx"
#alias cat "batcat --style=plain --theme ansi"
alias fd "fdfind"
alias tp "trash-put"
alias nn "nnn -ioeHE"
alias lg "lazygit"
alias zl "zellij"
alias td "todo.sh -t"
alias dt "date +%a\ %F\ %r"

set EDITOR /opt/nvim-linux64/bin/nvim

function cat
    # if file extension ends with .md or .mdx, use glow
    if string match -q "*.md" $argv
        glow $argv
    # if it is a binary file, use xxd
    else if file --mime $argv | grep -q "application"
        xxd $argv
    else if file --mime $argv | grep "png" || file --mime $argv | grep 'jpeg'
        kitty icat $argv
    # if it is a directory, use exa
    else if test -d $argv
        exa --icons -l $argv
    else
        batcat --style=plain --theme ansi $argv
    end
end

alias n "nvim"

alias nvm-lts "bass source ~/.nvm/nvm.sh --no-use ';' nvm use --lts"
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

bass source ~/.nvm/nvm.sh --no-use

alias nodejs "/home/noobscience/.nvm/versions/node/v23.3.0/bin/node"


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
    set EDITOR /opt/nvim-linux64/bin
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function tm
    set session_name (basename (pwd))

    if tmux has-session -t $session_name
        echo "Tmux session '$session_name' already exists."
        tmux attach-session -t $session_name
    else
        tmux new-session -s $session_name
    end
end

function tt
    set session_name $argv[1]
    if tmux has-session -t $session_name
        tmux attach-session -t $session_name
    else
        echo "Tmux session '$session_name' does not exist."
    end
end

function zln
    set session_name (basename (pwd))

    set session_exists (zellij list-sessions | grep -w $session_name)

    if test -z "$session_exists"
        echo "Session '$session_name' does not exist. Creating a new session..."
        zellij --layout noob attach --create $session_name
    else
        echo "Session '$session_name' already exists."
    end
end

alias zla "zellij --layout noob attach"
alias zl "zellij --layout noob"

zoxide init fish | source

function zz
    set -l dir $argv[1]
    if test -z "$dir"
    else
        z $dir
    end
    set file $(fzf)
    if test -n "$file"
        xdg-open $file
    else if test -n "$dir"
        cd $dir
    else
        echo "No file selected"
    end
end

function dd
    set file $(fzf)
    if test -n "$file"
        nvim $file
    else
        echo "No file selected"
    end
end

function nz
    # get first argument
    # if it is a directory, cd into it
    set -l dir $argv[1]
    # check if it is empty
    if test -z "$dir"
    else
        z $dir
    end
    set file $(fzf)
    if test -n "$file"
        nvim $file
    else if test -n "$dir"
        cd $dir
    else
        echo "No file selected"
    end
end

function zt
    set -l dir $argv[1]
    if test (count $argv) -ge 1 && test -d (zoxide query $dir)
        set dir (zoxide query $dir)
    else
        set dir $(zoxide query -l | fzf)
    end

    cd $dir

    set session_name (basename $dir)
    if tmux has-session -t $session_name
        echo "Tmux session '$session_name' already exists."
        tmux attach-session -t $session_name
    else
        tmux new-session -s $session_name
    end
end

function tz
    set session $(tmux list-sessions | cut -d ':' -f 1 | fzf)
    if test -n "$session"
        tmux attach-session -t $session
    else
        echo "No session selected"
    end
end

function region 
    swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | "\(.rect.x+.window_rect.x),\(.rect.y+.window_rect.y) \(.window_rect.width)x\(.window_rect.height)"' | slurp
end

set -gx PATH /home/noobscience/.bin $PATH
set -gx PATH /home/noobscience/go/bin $PATH
#set -gx PATH /home/noobscience/.applications/zig-linux-x86_64-0.12.0 $PATH
set -gx PATH /home/noobscience/.applications/zig-linux-x86_64-0.13.0 $PATH
set -gx PATH /home/noobscience/.applications/clion-2024.1.2/bin $PATH
set -gx PATH /home/noobscience/.applications/zen $PATH
set -gx PATH /home/noobscience/.cargo/bin $PATH
set -gx PATH /home/noobscience/.applications/bflat-8.0.2-linux-glibc-x64 $PATH
set -gx PATH /home/noobscience/.nvm/versions/node/v23.3.0/bin $PATH
set -gx PATH /home/noobscience/.bun/bin $PATH
set -gx PATH /opt/nvim-linux64/bin $PATH
set -gx PATH /opt/gradle/gradle-8.11.1/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.local/share/gem/ruby/3.3.0/bin $PATH

set -l gem_home (ruby -e 'puts Gem.user_dir')
set -l path $gem_home/bin $PATH

set GEM_HOME (ruby -e 'puts Gem.user_dir')

source "$HOME/.cargo/env.fish"

fzf --fish | source

#source ~/.asdf/asdf.fish

#nerdfetch 
#todo.sh lsp A-B

# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x8c'
