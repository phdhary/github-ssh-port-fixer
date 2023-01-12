#!/bin/bash

option1="Apply Github ssh over port 443" 
option2="Remove .ssh/config" 
option3="Check Github ssh connection"

apply_changes ()
{
    printf '%s\n' "host github.com
  hostname ssh.github.com
  port 443" >> "$HOME"/.ssh/config;

  gum style --border normal --padding "0 1" 'Added .ssh/config!'

  bat "$HOME"/.ssh/config
}

remove_config ()
{
    rm -rf "$HOME"/.ssh/config;
    gum style --border normal --padding "0 1" 'Removed .ssh/config!'
}

check_github_ssh_connection ()
{
    gum spin --show-output --title="Checking ssh connection..." -- ssh -T git@github.com;
}

main ()
{
    choices=$(gum choose "$option1" "$option2" "$option3")

    echo "$choices" | while read item
    do
        case "$item" in
            "$option1") apply_changes;
                ;;
            "$option2") gum confirm && remove_config;
                ;;
            "$option3") check_github_ssh_connection;
                ;;
        esac
    done
}

main
