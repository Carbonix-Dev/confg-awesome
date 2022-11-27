#!/bin/bash

case $1 in

  "userPfp")
    iconPath="/var/lib/AccountsService/icons/$USER"

    #userIconPath="$HOME/.config/awesome/src/assets/pfp.png"
    userIconPath = "$(sudo cat /var/lib/AccountsService/users/$(whoami) | grep Icon= | awk '{print $1}' | cut -d '=' -f 2)"

    if [[ -f "$userIconPath" ]];
    then
        if [[ -f "$iconPath" ]];
        then
            if ! cmp --silent "$userIconPath" "$iconPath";
            then
                rm "$userIconPath"
                cp "$iconPath" "$userIconPath"
            fi
            printf "$userIconPath"
        else
            printf "$userIconPath"
        fi
        exit;
    else
        if [[ -f "$iconPath" ]];
        then
            rm "$userIconPath"
            cp "$iconPath" "$userIconPath"
            printf "$userIconPath"
            exit;
        fi
    fi
  ;;

  "userName")
    fullname="$(getent passwd `whoami` | cut -d ':' -f 5)"
    user="$(whoami)"
    host="$(hostname)"
    if [[ "$2" == "userhost" ]];
    then
        printf "$user@$host"
    elif [[ "$2" == "fullname" ]];
    then
        printf "$fullname"
    else
        printf "Rick Astley"
    fi
  ;;

esac
