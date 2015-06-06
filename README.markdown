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

Change between screens:

* 'alt+shirt+,'
* 'alt+shirt+.'

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

# Ruby

## Install

    tar xfz ruby*tgz
    cd ruby*
    ./configure --prefix="${HOME}/.rubies/ruby-2.x.x" --disable-install-doc --disable-install-rdoc
    make && make install

## Default gems

    gem install bundler foreman mailcatcher tmuxinator

See `bin/install-default-gems.sh`.

# zsh

* `setopt no_hup`: Don't send HUP signal to background jobs when exiting ZSH;
* `setopt hist_verify`: Let the user edit the command line after history
expansion (e.g. !ls) instead of immediately running it;
* `setopt share_history`: Use the same history file for all sessions;
* `setopt no_clobber`: Prevent > redirection from truncating the given file if
it already exists;
* `setopt hist_ignore_all_dups`: Preventing duplicate lines in the history

# Fix

## zsh history substring search

To fix this error:

    _history-substring-search-end:13: _zsh_highlight: function definition file not found

Use:

    cd ~/.zprezto
    git submodule init
    git submodule update --init --recursive
    git submodule foreach git pull origin master

From: https://github.com/sorin-ionescu/prezto/issues/488

## PostgreSQL and Ruby On Rails

    could not connect to server: No such file or directory
            Is the server running locally and accepting
            connections on Unix domain socket "/run/postgresql/.s.PGSQL.5432"?

Install with `pg_config` path:

    gem install pg -- --with-pg-config=/home/dmitry/.linuxbrew/bin/pg_config

From: http://stackoverflow.com/questions/8465508/can-not-connect-to-local-postgresql/24837298#24837298
