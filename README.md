# Inception

##  Docker

# echo "vsftpd test file" | tee /home/$ftp_client/ftp/files/test.txt

# echo "
# user_sub_token=ftp_client
# local_root=/home/bbrahim/ftp
# pasv_min_port=40000
# pasv_max_port=40005
# userlist_enable=YES
# userlist_file=/etc/vsftpd.userlist
# userlist_deny=NO" >> /etc/vsftpd.conf

# set -e

# if ! cat /etc/vsftpd.userlist | grep www-data > /dev/null 2>&1; then
# 	chsh -s /bin/bash www-data
# 	usermod -d /var/www/html/wordpress www-data
# 	echo "www-data:testpass" | chpasswd
# 	chown -R www-data:www-data /var/www/html/wordpress
# 	echo www-data | tee -a /etc/vsftpd.userlist > /dev/null 2>&1
# fi

# service vsftpd start
# service vsftpd stop

# echo "*****Starting FTP Container*****"

# exec "$@"
# Footer
