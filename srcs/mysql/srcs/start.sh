mariadb-install-db -u root

mysqld -u root & sleep 5

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root wordpress < wordpress.sql
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

telegraf & tail -f /dev/null