if status is-interactive
    # Commands to run in interactive sessions can go here

    set -g fish_greeting ""
    /home/noobscience/.bin/nerdfetch
end

alias ls "exa --icons -l"
alias la "exa --icons -la --git"
alias ll "exa --icons -l --git"
alias bun "~/.bun/bin/bun"
alias bunx "~/.bun/bin/bunx"
alias cat "batcat --style=plain --theme ansi"
alias fd "fd-find"
alias tp "trash-put"
alias nn "nnn -deH"
alias lg "lazygit"

alias n "nvim"
alias nvm-lts "bass source ~/.nvm/nvm.sh --no-use ';' nvm use --lts"
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

function tm
    set session_name (basename (pwd))

    if tmux has-session -t $session_name
        echo "Tmux session '$session_name' already exists."
    else
        tmux new-session -s $session_name
    end
end

function nz
    nvim $(fzf)
end

set -gx PATH /home/noobscience/.bin $PATH
set -gx PATH /home/noobscience/go/bin $PATH
set -gx PATH /home/noobscience/.applications/zig-linux-x86_64-0.12.0 $PATH
set -gx PATH /home/noobscience/.cargo/bin $PATH

zoxide init fish | source
source ~/.asdf/asdf.fish

# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'
