function __llm_extract_commands

	  set argvstr (string join ' ' $argv)
		echo $argvstr
	  set -l backlist (__llm_get_choices $argvstr | sed 's/|.*//g')

		if test -z "$backlist"
			return
		end

		__llm_get_choices $argvstr | while read -L line
	    set parts (echo $line | string split '|')
			set cmd $parts[1]
			set desc $parts[2]

			echo "complete -f -c llm -n \"__fish_seen_subcommand_from $argv[1]; not __fish_seen_subcommand_from $backlist\" -a $cmd -d $desc"

			__llm_extract_commands $argv $cmd
		end
end
