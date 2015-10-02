#!/bin/bash

GDRIVE_ACCOUNT=$1
GDRIVE_AUTHCODE=$2

# Do sanity checks
if [ -z "${GDRIVE_ACCOUNT}" ]; then
    echo "No google drive account given. Exiting !"
    exit 1
fi

if [ -z "${GDRIVE_AUTHCODE}" ]; then
    echo "No google drive authentication code given. Exiting !"
    echo "To get the authenticatiom code, go to http://goo.gl/kTvy0y and follow prompts."
    exit 1
fi

mkdir -p /data/home/${GDRIVE_ACCOUNT}
/usr/bin/insync-headless add_account ${GDRIVE_AUTHCODE} /data/home/${GDRIVE_ACCOUNT}
/usr/bin/insync-headless set_autostart yes

exit 0
