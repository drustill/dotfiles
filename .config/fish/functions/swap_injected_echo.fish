function swap_injected_echo
    # The first argument is the command to run
		set command $argv[1]
		set custom_message $argv[2]

    # Suppress default output
    $command | head -n 1 > /dev/null

		# Sub with custom output
    echo "$custom_message"

		# Output ...rest
    $command | tail -n +2
end
