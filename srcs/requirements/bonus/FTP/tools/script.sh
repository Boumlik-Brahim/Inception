#!/bin/bash

adduser $FTP_CLIENT --disabled-password

echo "$FTP_CLIENT:$FTP_PASS" | /usr/sbin/chpasswd

echo "$FTP_CLIENT" | tee -a /etc/vsftpd.userlist

mkdir -p /home/$FTP_CLIENT/ftp

chown nobody:nogroup /home/$FTP_CLIENT/ftp
chmod a-w /home/$FTP_CLIENT/ftp

mkdir /home/$FTP_CLIENT/ftp/files
chown $FTP_CLIENT:$FTP_CLIENT /home/$FTP_CLIENT/ftp/files

service vsftpd start
service vsftpd stop

/usr/sbin/vsftpd