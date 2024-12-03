function query_candidate_by_name --description 'Candidate name -> (session, recording)'
    set name $argv[1]

    # Check if a name argument is provided
    if test (count $argv) -eq 0
        echo "Usage: find_candidates <name>"
        return 1
    end

    # PostgreSQL query with dynamic name input
    set query "WITH ranked_candidates AS (
			SELECT
					s.\"sessionId\",
					s.recording_ids,
					c.\"firstName\",
					c.\"lastName\",
					RANK() OVER (
							ORDER BY
									CASE
											WHEN LOWER(c.\"firstName\") = LOWER('$name')
													OR LOWER(c.\"lastName\") = LOWER('$name') THEN 1
											WHEN LOWER(c.\"firstName\") LIKE LOWER('%$name%')
													OR LOWER(c.\"lastName\") LIKE LOWER('%$name%') THEN 2
											ELSE 3
									END
					) AS rank
			FROM
					\"Session\" s
			JOIN
					\"Candidate\" c ON c.\"candidateId\" = s.\"candidateId\"
			WHERE
					array_length(s.recording_ids) > 0
		)
		SELECT
				\"sessionId\",
				recording_ids,
				\"firstName\",
				\"lastName\"
		FROM
				ranked_candidates
		WHERE
				rank < 4
		ORDER BY
				rank
		LIMIT 10;"

    # Execute the query using psql command
    psql -h $PGHOST -U postgres -d postgres -c "$query"
end
