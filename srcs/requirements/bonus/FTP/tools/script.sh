#!/bin/bash

adduser ftp_client --disabled-password

echo "ftp_client:ftp_pass" | /usr/sbin/chpasswd &> /dev/null

echo "ftp_client" | tee -a /etc/vsftpd.userlist &> /dev/null

mkdir -p /home/ftp_client/ftp

chown nobody:nogroup /home/ftp_client/ftp
chmod a-w /home/ftp_client/ftp

mkdir -p /home/ftp_client/ftp/files
chown ftp_client:ftp_client /home/ftp_client/ftp/files

# sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
# sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

# echo "
# local_enable=YES
# allow_writeable_chroot=YES
# pasv_enable=YES
# local_root=/var/www/html/wordpress
# pasv_min_port=40000
# pasv_max_port=40005
# userlist_enable=YES
# userlist_file=/etc/vsftpd.userlist
# userlist_deny=NO" >> /etc/vsftpd.conf

# service vsftpd start
# service vsftpd stop

/usr/sbin/vsftpd