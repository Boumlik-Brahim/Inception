CREATE DATABASE IF NOT EXISTS ma_base;
CREATE USER 'bbrahim' IDENTIFIED BY 'user42';
GRANT ALL PRIVILEGES ON ma_base.* TO 'bbrahim'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root42';