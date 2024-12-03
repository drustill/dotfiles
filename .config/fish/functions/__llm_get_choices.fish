function __llm_get_choices
	llm $argv --help | sed -n '/Commands:/,$p' | sed '1d' | tr -d '*' | sed -E 's/^[[:space:]]*([a-zA-Z0-9_-]+)\*?[[:space:]]+(.*)/\1|\2/'
end
