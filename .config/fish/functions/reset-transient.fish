# STARSHIP PROMPT FN

# Transience related functions
function reset-transient --on-event fish_postexec
    set -g TRANSIENT 0
end

