#!/bin/bash

adduser bbrahim

mkdir /home/bbrahim/ftp

chown nobody:nogroup /home/bbrahim/ftp
chmod a-w /home/bbrahim/ftp

mkdir /home/bbrahim/ftp/files
chown bbrahim:bbrahim /home/bbrahim/ftp/files

echo "vsftpd test file" | tee /home/bbrahim/ftp/files/test.txt

echo "bbrahim" | tee -a /etc/vsftpd.userlist

# echo "
# anonymous_enable=NO
# local_enable=YES
# write_enable=YES
# chroot_local_user=YES
# user_sub_token=bbrahim
# local_root=/home/bbrahim/ftp
# pasv_min_port=40000
# pasv_max_port=40005
# userlist_enable=YES
# userlist_file=/etc/vsftpd.userlist
# userlist_deny=NO" >> /etc/vsftpd.conf

service vsftpd start
service vsftpd stop

/usr/sbin/vsftpd