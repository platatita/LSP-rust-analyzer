#! /bin/bash

# It creates the symbolic link from this source package to sublime package
#
# Usage
#   ./local_linker.sh       - to link or relink (unlink/link)
#   ./local_linker.sh -u    - to unlink


if [[ "$OSTYPE" == "linux-gnu" ]];
then
    SUBLIME_PACKAGE="$HOME/.config/sublime-text-3/Packages/LSP-rust-analyzer"
else
    if [[ -d "$HOME/Library/Application Support/Sublime Text 3" ]];
    then
        SUBLIME_PACKAGE="$HOME/Library/Application Support/Sublime Text 3/Packages/LSP-rust-analyzer"
    else
        SUBLIME_PACKAGE="$HOME/Library/Application Support/Sublime Text/Packages/LSP-rust-analyzer"
    fi
fi

SOURCE_PACKAGE=`pwd`

if [[ -L "$SUBLIME_PACKAGE" ]];
then
    echo "Link '$SUBLIME_PACKAGE' exists - has been unlinked"
    unlink "$SUBLIME_PACKAGE"
fi

if [[ "$1" != "-u" ]]; then
    echo "Link '$SUBLIME_PACKAGE' - has been created"
    ln -s "$SOURCE_PACKAGE" "$SUBLIME_PACKAGE"
fi

