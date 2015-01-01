# Install

    % git clone https://github.com/dmitrynix/dot-files.git .dot-files
    % cd .dot-files
    % ./run.sh

# local install

Add to shell:

    export CFLAGS="-I${HOME}/local/include"
    export LDFLAGS="-L${HOME}/local/lib"

From: [http://blog.sanctum.geek.nz/compiling-in-home/](http://blog.sanctum.geek.nz/compiling-in-home/)

# Start PostgreSQL

    % initdb -D ~/local/var/lib/postgres/data

# DWM

## Compile and install

    % make && make PREFIX=~/local install

## desktop file

    % cat /usr/share/xsessions/dwm.desktop
    [Desktop Entry]
    Encoding=UTF-8
    Name=Dwm
    Comment=Dynamic window manager
    Exec=/home/dmitry/local/bin/dwm
    Icon=dwm
    Type=XSession

# St terminal

Compile and install with:

    % make && make PREFIX=~/local install

# Default gems

    gem install bundler foreman mailcatcher tmuxinator

See `bin/install-default-gems.sh`.

# Fix

To fix this error:

    _history-substring-search-end:13: _zsh_highlight: function definition file not found

Use:

    cd ~/.zprezto
    git submodule init
    git submodule update --init --recursive
    git submodule foreach git pull origin master

From: https://github.com/sorin-ionescu/prezto/issues/488
