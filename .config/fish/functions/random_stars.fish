function random_stars
		set emojis "💫 ✨ 🌟"
		set icons "✩ ✮ ✯ ✦ ✧   " # Whitespace is important

		set agg_symbols (string join " " $chars $emojis)
		set mid (math (chct $agg_symbols) / 2)

		set ct_emoji (math (random 1 $mid) + $mid)
		set ct_icon (math (chct $agg_symbols) - $ct_emoji)


		function symbol_collect
			if test -z "$res"
				set res ""
			end

			set symbsz (chct $argv[1])
			for i in (seq $symbsz)
				set pidx (random 1 1 $symbsz)
				set res "$res$argv[1][$pidx]"
			end
		end

		symbol_collect $emojis
		symbol_collect $icons

		# Shuffle & print
    set shuffled (string split "" $result | sort -R | string join "" -)
		echo $shuffled
end
