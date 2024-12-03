function fetch_transcript
       # Use the provided session ID or fallback to the default one
       if test (count $argv) -eq 1
           set session_id $argv[1]
       else
           set session_id $SESSION
       end

       # Execute the SQL command using psql
       psql -h db.pebloifvfgdjdbunjgur.supabase.co -U postgres -d postgres -c "SELECT te.speaker, te.start_time FROM transcript_entry te WHERE te.session_id = '$session_id' ORDER BY te.start_time;"
end
