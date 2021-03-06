# colors
tput sgr0; # reset colors
bold=$(tput bold);
reset=$(tput sgr0);
black=$(tput setaf 0);
blue=$(tput setaf 33);
cyan=$(tput setaf 37);
green=$(tput setaf 71);
orange=$(tput setaf 166);
purple=$(tput setaf 125);
red=$(tput setaf 124);
violet=$(tput setaf 61);
white=$(tput setaf 15);
yellow=$(tput setaf 136);

# icons
icon_next="❯"
icon_check="✓"

# git prompt
prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

            # Check for clean state
            if [ -z "$s" ]; then
                s+="${icon_check}";
            fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s="${s}";

		echo -e "${1}${branchName}${2}${s}${3} ";
	else
		return;
	fi;
}

# bash prompt
PS1="\[${bold}\]";
PS1+="\[${blue}\]\u";                   # user
PS1+="\[${red}\]@";
PS1+="\[${cyan}\]\h ";		            # host
PS1+="\[${green}\]\W "; 		        # current directory
PS1+="\$(prompt_git \"\[${white}\][\[${violet}\]\" \[${white}\]\|\"\[${blue}\]\" \[${white}\]] )"; # Git repository details
PS1+="\[${white}\]${icon_next} \[${reset}\]";
export PS1