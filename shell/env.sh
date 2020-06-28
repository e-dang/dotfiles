export SAVEHIST=1000000

# Color ls output better than default but worse than if using dircolors
if [ "${USING_DIR_COLORS}" = false ]; then
    export CLICOLOR=1
    export LSCOLORS='exbxgxdxcxGxDxcxcxexex'
fi
unset USING_DIR_COLORS

# Add compiler flags for using brew llvm as default compiler. TAG:CLANG_COMPILER
if [[ $(brew list | grep "llvm")  ]] 2> /dev/null; then
    LDFLAGS += -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib
    CPPFLAGS += -I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/
    export CC=$(which clang)
    export CXX=$(CC)++
fi

# If homebrew installs gcc, update env vars so it is the default gcc. Note - may need to update paths depending on version. TAG:GCC_COMPILER
if [[ $(brew list | grep "gcc")  ]] 2> /dev/null; then
    LDFLAGS += -L/usr/local/opt/gcc/lib/gcc/9 -Wl,-rpath,/usr/local/opt/gcc/lib/gcc/9
    CPPFLAGS += -I/usr/local/opt/gcc/include -I/usr/local/opt/gcc/include/c++/9.2.0/
    export CC=$(which gcc)
    export CXX=$(CC)++
fi