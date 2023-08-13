#!/bin/sh
mkdir -p ~/.local/git ~/.config/alacritty
cd ~/.local/git/  || exit
nix-env -iA gh git
gh auth login
gh repo clone dotdir
sudo rm /etc/nixos/configuration.nix
sudo ln -s ~/.local/git/dotdir/configuration.nix /etc/nixos/configuration.nix 
cp ~/.local/git/dotdir/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.local/git/dotdir/org-roam ~/org-roam
nix-env -e gh git
sudo nixos-rebuild switch
emacs dotdir/init.org
emacs
systemctl enable --user emacs.service
systemctl start --user emacs.service
mkdir -p ~/dev/{rust,elisp,haskell,python,shell}
