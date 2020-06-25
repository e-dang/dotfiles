
# source the shell dotfiles
for file in ./.shell/{aliases.sh,functions.sh,env.sh,path.sh}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# source the bash dotfiles
for file in ./.bash/{bash_prompt.sh}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

# key bindings
bind -f ./.inputrc

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell