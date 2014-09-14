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
