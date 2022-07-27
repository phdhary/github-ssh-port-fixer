apply_changes ()
{
    printf '%s\n' "host github.com
  hostname ssh.github.com
  port 443" >> $HOME/.ssh/config;

    printf '%s\n' "Added .ssh/config";
}

remove_config ()
{
    rm -rf $HOME/.ssh/config;
    printf '%s\n' "Removed .ssh/config";
}

check_github_ssh_connection ()
{
    ssh -T git@github.com;
}

main ()
{
    while [[ true ]]; do
        read -p "
    ==What you wanna do?==
1) Apply Github ssh over port 443
2) Remove .ssh/config
3) Check Github ssh connection
(1/2/3): " options
        case "$options" in
            1) apply_changes;
                break
                ;;
            2) remove_config;
                break
                ;;
            3) check_github_ssh_connection;
                break
                ;;
            *) echo "Answer with number please"
                ;;
        esac
    done
}

main
