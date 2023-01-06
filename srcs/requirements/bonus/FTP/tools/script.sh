#!/bin/bash

# adduser ftp_client
# adduser ftp_client --disabled-password

# mkdir /home/ftp_client/ftp

# chown nobody:nogroup /home/ftp_client/ftp
# chmod a-w /home/ftp_client/ftp

# mkdir /home/ftp_client/ftp/files
# chown ftp_client:ftp_client /home/ftp_client/ftp/files

# echo "vsftpd test file" | tee /home/ftp_client/ftp/files/test.txt

# echo "ftp_client" | tee -a /etc/vsftpd.userlist

# echo "ftp_client:testpass" | chpasswd

cat /etc/vsftpd.userlist | grep ftp_client > /dev/null 2>&1;
chsh -s /bin/bash ftp_client
usermod -d /var/www/html/wordpress ftp_client
echo "ftp_client:testpass" | chpasswd
chown -R ftp_client:ftp_client /var/www/html/wordpress
echo ftp_client | tee -a /etc/vsftpd.userlist > /dev/null 2>&1

echo "
write_enable=YES
chroot_local_user=YES
user_sub_token=ftp_client
local_root=/home/bbrahim/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" >> /etc/vsftpd.conf

service vsftpd start
service vsftpd stop

/usr/sbin/vsftpd