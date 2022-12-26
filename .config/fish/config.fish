if status --is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
    starship init fish | source
end

