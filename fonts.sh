#!/usr/bin/env bash

# BASEDIR should already be set from install script, but just to be safe...
if [ -z ${BASEDIR} ]; then
    BASEDIR=$(dirname ${BASH_SOURCE})
fi

# Default is to install fonts system wide
if [ -z ${INSTALL_FONTS_SYSTEM} ]; then
    INSTALL_FONTS_SYSTEM=true
fi

FONTS_DIR=${BASEDIR}/fonts
for file in ${FONTS_DIR}/*.ttf; do
    echo ${file}
    if [ ${INSTALL_FONTS_SYSTEM} = true ]; then
        sudo cp -v "${file}" "/Library/Fonts/$(basename "${file}")"
    else
        cp -v "${file}" "~/Library/Fonts/$(basename "${file}")"
    fi
done

unset FONTS_DIR
unset INSTALL_FONTS_SYSTEM