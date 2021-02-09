#!/usr/bin/env bash
set -x 

##############
# BIN
##############

mkdir -p $HOME/bin

##############
# FASD
##############

if [[ ! -f $HOME/bin/fasd ]]; then
   git clone https://github.com/clvv/fasd.git /tmp/fasd
   cd /tmp/fasd
   PREFIX=$HOME make install
   cd -
fi

##############
# FZF
##############

if [[ ! -f $HOME/.fzf/bin/fzf ]]; then
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    yes | $HOME/.fzf/install
fi

#######################
# TMUX
#######################

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    mkdir -p $HOME/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# Fast syntax highlighting
if [[ ! -d $HOME/.zsh/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
fi
