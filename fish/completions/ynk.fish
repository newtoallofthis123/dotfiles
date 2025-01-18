# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_ynk_global_optspecs
	string join \n n/noignore y/yes a/all h/help V/version
end

function __fish_ynk_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_ynk_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_ynk_using_subcommand
	set -l cmd (__fish_ynk_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c ynk -n "__fish_ynk_needs_command" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_needs_command" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_needs_command" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_needs_command" -s h -l help -d 'Print help'
complete -c ynk -n "__fish_ynk_needs_command" -s V -l version -d 'Print version'
complete -c ynk -n "__fish_ynk_needs_command" -f -a "list"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "add"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "delete"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "pop"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "clear"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "paste"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "completions"
complete -c ynk -n "__fish_ynk_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ynk -n "__fish_ynk_using_subcommand list" -l size -d 'Calculate and show the size column'
complete -c ynk -n "__fish_ynk_using_subcommand list" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand list" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand list" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand add" -l dir -d 'Set sign as a dir'
complete -c ynk -n "__fish_ynk_using_subcommand add" -l preserve -d 'Preserves the dir structure'
complete -c ynk -n "__fish_ynk_using_subcommand add" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand add" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand add" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand delete" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand delete" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand delete" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand pop" -l overwrite -d 'Overwrite existing files'
complete -c ynk -n "__fish_ynk_using_subcommand pop" -l strict -d 'Error on any IO error'
complete -c ynk -n "__fish_ynk_using_subcommand pop" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand pop" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand pop" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand pop" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand clear" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand clear" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand clear" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand clear" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s o -l output -d 'The output dir or file' -r
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s r -l range -d 'Specify the range of entries to paste: Works using the syntax of n..[m]' -r
complete -c ynk -n "__fish_ynk_using_subcommand paste" -l overwrite -d 'Overwrite existing files'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -l strict -d 'Error on any IO error'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s d -l delete -d 'Delete the entry from the store after pasting'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand paste" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand completions" -s n -l noignore -d 'Don\'t respect the .gitignore'
complete -c ynk -n "__fish_ynk_using_subcommand completions" -s y -l yes -d 'Prompt yes to all prompts'
complete -c ynk -n "__fish_ynk_using_subcommand completions" -s a -l all -d 'Also include hidden files in discovery'
complete -c ynk -n "__fish_ynk_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "list"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "add"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "delete"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "pop"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "clear"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "paste"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "completions"
complete -c ynk -n "__fish_ynk_using_subcommand help; and not __fish_seen_subcommand_from list add delete pop clear paste completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'

