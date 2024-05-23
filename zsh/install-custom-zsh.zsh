#!/bin/zsh
cp /Users/$USER/.zshrc /Users/$USER/.zshrc_bak
rm /Users/$USER/.zshrc
ln -s /Users/$USER/projects/dev-environment/zsh/.zshrc /Users/$USER/.zshrc

