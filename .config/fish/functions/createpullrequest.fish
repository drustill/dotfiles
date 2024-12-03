function createpullrequest --description 'Create a pull request'
	git pull origin dev
	set curr (git rev-parse --abbrev-ref HEAD)

	if test $curr = "dev"
		echo "dev"
		read -P "dru/" branch
		echo $branch
		git switch -c $branch
	else
		git checkout $curr
	end

	gh pr create --base dev
end
