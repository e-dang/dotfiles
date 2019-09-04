
# load the shell dotfiles:
for file in ./.{bash_prompt,aliases,functions,env,path}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# bind .inputrc
bind -f ./.inputrc
