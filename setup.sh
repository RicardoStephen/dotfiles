#!/bin/bash

# important directories
SRC=$(pwd)
DST=~

# setup directory for old dotfiles
mkdir -p $SRC/old

# customization file
touch .custom

# config files
files=(.aliases .bash_profile .bash_prompt .bashrc .curlrc .exports .functions .gitignore .hgignore .hushlogin .inputrc .screenrc .wgetrc .custom)

for f in "${files[@]}"
do
    # move old config files to ./old
    mv $DST/$f $SRC/old
    # create symbolic link to the new config file
    ln -s $SRC/$f $DST
done

echo "TODO Configure terminal's appearance"
echo "1. Shell->Import..."
echo "2. Select settings.terminal"
echo "3. Shell->Use Settings as Default"
echo "TODO add to .spacemacs"
echo "look at included .spacemacs for refernce"
echo "TODO add emacsdameon script to login items"
