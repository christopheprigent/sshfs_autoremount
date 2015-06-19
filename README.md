# sshfs_autoremount
 simple script to make live or force remount every 10 sec.                                                                                   
 so you can have a persistent cnx.                                                                                                           
 Used with sftp host by gandi.
 NB : you have to configure ssh private key to enable remount auto.

## Config
 open sshfs_autoremount.sh and change variables :
```vars
          BIN_SSHFS='/usr/bin/sshfs'
          BIN_SLEEP='/bin/sleep'
        MOUNT_POINT='/mnt/your_mount_point'
               USER='sftp_user'
               HOST='sftp_host'
REMOTE_DIR_TO_MOUNT='/'
REMOTE_DIR_TO_CHECK='i_am_used_in_ls'
       SEC_TO_SLEEP=10
```

## Command line usage
 just run sshfs_autoremount.sh

## Sample output :
```shell
$ sh sshfs_autoremount.sh 
auto remount
live OK
live OK
live OK
live OK
live OK
live OK
live OK
live OK
live OK
auto remount
live OK
live OK
live OK
live OK
```

