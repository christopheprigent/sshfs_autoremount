#!/bin/dash
#title           :sshfs_autoremount.sh
#description     :simple script to make live or force remount every 10 sec. Used with sftp host by gandi.
#author          :christophe.prigent_AT_gmail.com
#date            :20150619
#version         :0.1
#usage           ::sshfs_autoremount.sh
#dash_version    :0.5.7-3
#===============================================================================

          BIN_SSHFS='/usr/bin/sshfs'
          BIN_SLEEP='/bin/sleep'
        MOUNT_POINT='/mnt/your_mount_point'
               USER='sftp_user'
               HOST='sftp_host'
REMOTE_DIR_TO_MOUNT='/'
REMOTE_DIR_TO_CHECK='i_am_use_in_ls'
       SEC_TO_SLEEP=10

alias _remount="$BIN_SSHFS $USER@$HOST:$REMOTE_DIR_TO_MOUNT $MOUNT_POINT; cd ."

alias _remount

while [ 42 ];do
    ls -d "$MOUNT_POINT/$REMOTE_DIR_TO_CHECK/" > /dev/null && echo "live OK" || ( _remount && echo "auto remount" )
    $BIN_SLEEP $SEC_TO_SLEEP
done
