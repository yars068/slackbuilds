#!/bin/sh

# armagetronad default user to use with Master server creation script.

user=armagetronad

if test -w /etc/passwd; then
    echo "Creating user ${user}..."

    if which useradd > /dev/null 2>&1; then
        useradd ${user} || echo -e "\nWarning: unable to create user with 'useradd'. Giving up.\n"
    else

        if which pw > /dev/null 2>&1; then
            pw useradd ${user} || echo "Warning: unable to create user with 'pw'. Giving up."
        else
            echo -e "\nWarning: unable to find suitable program to add user.\n"
        fi

    fi

    else # no write acces to /etc/passwd
        echo -e "\nWarning: no write access to /etc/passwd, can't add user. Try as root.\n"
fi
