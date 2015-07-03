#!/bin/sh
#title           :sshfs_autoremount.sh
#description     :
# simple script to make live or force remount every 10 sec.
# so you can have a persistent cnx.
# Tried with sftp host by gandi.
#author          :christophe.prigent_AT_gmail.com
#date            :20150703
#version         :0.2
#usage           ::sshfs_autoremount.sh
#dash_version    :0.5.7-3
#===============================================================================
echo "loading settings.cfg" 
. ./settings.cfg 
echo "will mount : '$USER@$HOST:$REMOTE_DIR_TO_MOUNT' to '$MOUNT_POINT' every ${SEC_TO_SLEEP}s"

alias _remount="$BIN_SSHFS $USER@$HOST:$REMOTE_DIR_TO_MOUNT $MOUNT_POINT; cd ."

while [ 42 ];do
    ls -d "$MOUNT_POINT/$REMOTE_DIR_TO_CHECK/" > /dev/null 2>&1 && echo "live OK" || ( _remount && echo "auto remount" )
    $BIN_SLEEP $SEC_TO_SLEEP
done
