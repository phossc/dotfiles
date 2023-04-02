set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

if status --is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
    starship init fish | source
end

