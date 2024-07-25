#!/bin/sh

git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"
ln -s "$(brew --prefix llvm)/bin/clang-apply-replacements" "/usr/local/bin/clang-apply-replacements"
