#
# Set default
#

function __sf_util_set_default -a var -d "Set the default value for a global variable"
	# Multiple arguments will become a list
	set -q $var; or set -g $var $argv[2..-1]
end
