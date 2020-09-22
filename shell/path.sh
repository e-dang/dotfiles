# If homebrew installs python3, update PATH so it is the default python
if [[ -d /usr/local/opt/python/libexec/bin ]]; then
    path_prepend /usr/local/opt/python/libexec/bin
fi
