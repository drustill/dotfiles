function funcdef

		# Error Handles Bitch #23 Mical Jawdn
    if test (count $argv) -eq 0
        echo "Usage: funcdef <function_name>"
        return 1
    end

		# New function name
    set function_name $argv[1]

    # New function's stub
    funced --save --editor vim $function_name

    echo "Function '$function_name' has been saved."
end
