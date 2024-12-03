function set_session
if test (count $argv) -eq 1
set -gx SESSION $argv[1]
echo "Set session "
else
echo "None provided"
end
end
