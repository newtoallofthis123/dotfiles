if status is-interactive
    # Commands to run in interactive sessions can go here

    set -g fish_greeting ""
    # /home/noobscience/.bin/nerdfetch
end

alias ls "exa --icons -l"
alias la "exa --icons -la --git"
alias ll "exa --icons -l --git"
alias lt "exa --icons --tree --git"
alias bun "~/.bun/bin/bun"
alias bunx "~/.bun/bin/bunx"
alias cat "batcat --style=plain --theme ansi"
alias fd "fd-find"
alias tp "trash-put"
alias nn "nnn -ioeH"
alias lg "lazygit"
alias zl "zellij"
alias td "todo.sh -t"
alias dt "date +%a\ %F\ %r"

alias n "nvim"
alias nvm-lts "bass source ~/.nvm/nvm.sh --no-use ';' nvm use --lts"
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

set EDITOR nvim

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
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

function nz
    nvim $(fzf)
end

set -gx PATH /home/noobscience/.bin $PATH
set -gx PATH /home/noobscience/go/bin $PATH
#set -gx PATH /home/noobscience/.applications/zig-linux-x86_64-0.12.0 $PATH
set -gx PATH $HOME/.applications/zig-linux-x86_64-0.13.0 $PATH
set -gx PATH /home/noobscience/.applications/clion-2024.1.2/bin $PATH
set -gx PATH /home/noobscience/.cargo/bin $PATH
set -gx PATH /home/noobscience/.applications/bflat-8.0.2-linux-glibc-x64 $PATH
set -gx PATH /home/noobscience/.bun/bin $PATH
set -gx PATH /opt/nvim-linux64/bin $PATH

zoxide init fish | source
source ~/.asdf/asdf.fish

#nerdfetch 
#todo.sh lsp A-B

# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'
