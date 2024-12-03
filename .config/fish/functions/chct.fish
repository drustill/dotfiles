function chct --description 'Count Characters in a String (split by space)'
	if test (count $argv) -ne 1
		echo "Usage: chct <string> -- Count Characters in a String (split by space)"
		return 1
	end

	echo (count (string split ' ' (string trim $argv[1])))
end
