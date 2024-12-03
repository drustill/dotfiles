function get_recording
    set recording_id $argv[1]

    if test -z $recording_id
        echo "Usage: get_recording <recording_id>"
        return 1
    end
    set bearer_token "720eaa333bda9190958cf39f9184fa51323b13a0589717d1f28198e74c69d15e"

    curl --request GET --header "Authorization: Bearer $bearer_token" "https://api.daily.co/v1/recordings/$recording_id/access-link" | jq '.download_link'
end
