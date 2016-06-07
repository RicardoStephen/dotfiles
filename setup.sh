#!/bin/bash

# important directories
SRC=$(pwd)
DST=~

# setup directory for old dotfiles
mkdir -p $SRC/old

# install osx-trash
if [ ! -f /usr/local/bin/trash ]; then
    git clone https://github.com/sindresorhus/osx-trash
    cd osx-trash
    ./build
    mv trash /usr/local/bin
    cd $SRC
    trash osx-trash
fi

# customization file
touch .custom

# config files
files=(.aliases .bash_profile .bash_prompt .bashrc .curlrc .exports .functions .gitignore .hgignore .hushlogin .inputrc .screenrc .spacemacs .wgetrc .custom)

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

