#!/bin/bash

# bold text
bold=$(tput bold)

# User list
myuser=(
    "admin-user" "rathana" "koeun" "sovann"
)

LINE="============================="
echo "List of users to generate token"
echo "$LINE"

printf "$bold%s\n" "${myuser[@]}"

echo "$LINE"
# Assign first argument
USER=$1

# Conditional Statement
if [ -z "$1" ]; then
    echo "emply string"
else
    case $USER in
        ${USER[0]})
            echo "You generate token for: $USER"
            kubectl create -n kubernetes-dashboard token "${USER[0]}" --duration=48h -o=yaml > "${USER[0]}"Token.yaml
        ;;
        ${USER[1]})
            echo "You generate token for: $USER"
            kubectl create -n kubernetes-dashboard token "${USER[1]}" --duration=48h -o=yaml > "${USER[1]}"Token.yaml
        ;;
        ${USER[2]})
            echo "You generate token for: $USER"
            kubectl create -n kubernetes-dashboard token "${USER[2]}" --duration=48h -o=yaml > "${USER[2]}"Token.yaml
        ;;
        ${USER[3]})
            echo "You generate token for: $USER"
            kubectl create -n kubernetes-dashboard token "${USER[3]}" --duration=48h -o=yaml > "${USER[3]}"Token.yaml
        ;;
    esac
fi