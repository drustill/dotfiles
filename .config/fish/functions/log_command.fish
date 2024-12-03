function log_command --on-event fish_preexec
    echo $argv[1] >>  ~/.local/share/fish/fish_full_history
end
