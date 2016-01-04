#!/bin/bash

GDRIVE_ACCOUNT=$1

# Do sanity checks
if [ -z "${GDRIVE_ACCOUNT}" ]; then
    echo "No google drive account given. Exiting !"
    exit 1
fi

TERM=xterm /usr/bin/insync-headless manage_selective_sync ${GDRIVE_ACCOUNT}

exit 0
