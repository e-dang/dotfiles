# If homebrew installs python3, update PATH so it is the default python
if [[ $(brew list | grep "python")  ]] 2> /dev/null; then
    path_prepend /usr/local/opt/python/libexec/bin
fi


# If homebrew installs llvm, update PATH so it is the default clang. TAG:CLANG_COMPILER
if [[ $(brew list | grep "llvm")  ]] 2> /dev/null; then
    path_prepend /usr/local/opt/llvm/bin
fi