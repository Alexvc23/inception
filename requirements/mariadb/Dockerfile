# Penultime debian stable version 
FROM	debian:buster

ARG		MYSQL_ROOT_PASSWORD
ARG		MYSQL_DATABASE
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD

# update and upgraade the system
RUN		apt-get update -y \
&&		apt upgrade -y

# install mariadb
RUN		apt-get install -y mariadb-server

# creates mariabd database taking intou account the provided arguments
RUN		service mysql start \
&&		mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
		FLUSH PRIVILEGES;"

# Expose port 3306 to the host
EXPOSE	3306

# Execute data base when container starts allowing connections 
# from any ip address 
ENTRYPOINT	["mysqld", "--bind-address=0.0.0.0"]