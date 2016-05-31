#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/work/dotfiles                    # dotfiles directory
olddir=~/work/dotfiles_old             # old dotfiles backup directory
files="bash_profile bashrc vimrc vim bash_custom inputrc menurc"    # list of files/folders to symlink in homedir


##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir $dir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    test -f ~/.$file && mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    test -h ~/.$file || ln -s $dir/$file ~/.$file
done
