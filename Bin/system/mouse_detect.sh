#!/bin/sh

lista=`xinput list | grep -i 'mouse' | grep -i 'gaming'`
listb=`xinput list | grep -i 'transceiver' | grep -i 'pointer'`
listc=`xinput list | grep -i 'receiver' | grep -i 'pointer'`

if [ ${#lista} -eq 0 ] && [ ${#listb} -eq 0 ] && [ ${#listc} -eq 0 ]; then
    exec `xinput enable ELAN0515:01\ 04F3:3142\ Touchpad`
else
    exec `xinput disable ELAN0515:01\ 04F3:3142\ Touchpad`
fi
