function seconds_to_ffmpeg_fmt --description 'Seconds -> HH:MM:SS'
    set seconds $argv[1]

    # Check if the input is a number
    if not echo $seconds | grep -q '^[0-9]*$'
        echo "Error: Input must be a number."
        return 1
    end

    # Calculate hours, minutes and remaining seconds
    set hours (math "floor($seconds / 3600)")
    set minutes (math "floor(($seconds % 3600) / 60)")
    set remaining_seconds (math "$seconds % 60")

    # Format
    printf "%02d:%02d:%02d\n" $hours $minutes $remaining_seconds
end
