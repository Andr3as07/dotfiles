#!/bin/bash

# SOURCE: https://github.com/linkfrg/dotfiles/blob/main/.config/hypr/scripts/hyprlock-time.sh 


current_hour=$(date +"%H")
user_string=$(cat /etc/passwd | grep $USER: | cut -d ':' -f 5)

if [ "$current_hour" -ge 5 ] && [ "$current_hour" -lt 10 ]; then
    echo "Good morning, $user_string"
elif [ "$current_hour" -ge 10 ] && [ "$current_hour" -lt 17 ]; then
    echo "Good day, $user_string"
elif [ "$current_hour" -ge 17 ] && [ "$current_hour" -lt 22 ]; then
    echo "Good evening, $user_string"
else
    echo "Good night, $user_string"
fi
