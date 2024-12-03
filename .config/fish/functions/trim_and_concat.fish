function trim_and_concat
    # Check if the right number of arguments are provided
    if test (count $argv) -ne 3
        echo "Usage: trim_and_concat <input1.mp4> <trim_secs> <input2.mp4>"
        return 1
    end

    set input1 $argv[1]
    set trim_secs (seconds_to_ffmpeg_fmt $argv[2])
    set input2 $argv[3]

    # Trim the first video to the specified seconds with progress
		ffmpeg -y -t $trim_secs -i $input1 -c copy trimmed_input1.mp4 -progress pipe:1 > ffmpeg_output_trim.log 2>&1 | while read line
				if echo $line | grep -q "out_time_ms"
						echo $line
				end
		end

    # Create a file list for concatenation
    echo -e "file 'trimmed_input1.mp4'\nfile '$input2'" > file_list.txt

		echo "  Trimmed  "
		bat file_list.txt
		# echo ""

    # Concatenate the videos with progress
    ffmpeg -y -f concat -safe 0 -i file_list.txt -c copy output.mp4 -progress pipe:1 > ffmpeg_output_concat.log 2>&1 | while read line
				if echo $line | grep -q "out_time_ms"
						echo $line
				end
		end


    # Cleanup intermediary files
    rm trimmed_input1.mp4 file_list.txt
end
