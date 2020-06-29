# If homebrew installs python3, update PATH so it is the default python
if [[ -d /usr/local/opt/python/libexec/bin ]]; then
    path_prepend /usr/local/opt/python/libexec/bin
fi


# If homebrew installs llvm, update PATH so it is the default clang. TAG:CLANG_COMPILER
if [[ -d /usr/local/opt/llvm/bin ]]; then
    path_prepend /usr/local/opt/llvm/bin
fi