#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Bash tools
brew install tree

#Neovim
brew install neovim/neovim/neovim
# Setup Node Yarn
brew install node
brew install yarn
export PATH="$PATH:`yarn global bin`"

