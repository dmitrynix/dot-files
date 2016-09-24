# Install

    % git clone https://github.com/dmitrynix/dot-files.git .dot-files
    % cd .dot-files
    % ./run.sh

# Compiling local

Add to shell:

    export CFLAGS="-I${HOME}/local/include"
    export LDFLAGS="-L${HOME}/local/lib"

From: [http://blog.sanctum.geek.nz/compiling-in-home/](http://blog.sanctum.geek.nz/compiling-in-home/)

# Ruby

## Install

    tar xfz ruby*tgz
    cd ruby*
    ./configure --prefix="${HOME}/.rubies/ruby-2.x.x" --disable-install-doc --disable-install-rdoc
    make && make install

For references see: [4.5 Ways to Install Ruby in Userspace](https://blog.codeminer42.com/4-5-ways-to-install-ruby-in-userspace-d26b0ba43610).

## Default gems

See `bin/install-default-gems.sh`.

# zsh

* `setopt no_hup`: Don't send HUP signal to background jobs when exiting ZSH;
* `setopt hist_verify`: Let the user edit the command line after history
expansion (e.g. !ls) instead of immediately running it;
* `setopt share_history`: Use the same history file for all sessions;
* `setopt no_clobber`: Prevent > redirection from truncating the given file if
it already exists;
* `setopt hist_ignore_all_dups`: Preventing duplicate lines in the history
