#!/bin/bash

# put assumer[d/ctl] in /usr/local/bin folder
# hopefully it is part of $PATH variable
if test -e ./assumerd; then
    cp ./assumerd /usr/local/bin/assumerd
else
    echo './assumerd not found'
    exit 1;
fi

if test -e ./assumerctl; then
    cp ./assumerctl /usr/local/bin/assumerctl
else
    echo './assumerctl not found'
    exit 1;
fi

chmod +x /usr/local/bin/assumerd
chmod +x /usr/local/bin/assumerctl

# create init system file
# depending on the OS of the client
__os=$(uname)

# if [[ $__os == 'Linux' ]]; then
#     __agents_path="/etc/systemd/system"
#
#     echo;
# fi

if [[ $__os == 'Darwin' ]]; then
    __home='~'
    if test -n $HOME; then
        __home=$HOME
    fi

    __agents_path="$__home/Library/LaunchAgents"
    if test -e ./io.github.fuadop.assumerd.plist; then
        cp ./io.github.fuadop.assumerd.plist $__agents_path/io.github.fuadop.assumerd.plist

        # load the agent to
        # the gui/ domain target
        # you can run only when the user is logged-in
        __id=$(id -u)
        launchctl bootstrap gui/$__id $__agents_path/io.github.fuadop.assumerd.plist
    else
        echo 'plist file not found'
        exit 1;
    fi
fi
