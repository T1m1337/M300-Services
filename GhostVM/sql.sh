apt-get update
apt-get install mysql-server -y
mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
quit