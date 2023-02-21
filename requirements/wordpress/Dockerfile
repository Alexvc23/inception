# Define the base image to be used for this Dockerfile
FROM	debian:buster

# Arguments to be passed during image creation
ARG		MYSQL_DATABASE
ARG		MYSQL_USER
ARG		MYSQL_PASSWORD
ARG		MYSQL_HOST

# Update the system with the latest packages
RUN		apt-get update -y \
# Upgrade the system with the latest packages
&&		apt-get upgrade -y \
# Install the wget package tool that allows to download files easily to the local machine
&&		apt-get install -y wget

# Install and configure PHP
RUN		apt-get install -y php-fpm php-mysql \
# Start and stop the PHP-FPM service
&&		service php7.3-fpm start && service php7.3-fpm stop \
# Modify the PHP-FPM configuration to use the socket wordpress:9000
&&		sed -i "s/\/run\/php\/php7.3-fpm.sock/wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

# Install the WP-CLI tool
ADD		https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
# Make the WP-CLI file executable wordpress command line tools
RUN		chmod +x /usr/local/bin/wp \
# Create the /var/www/html/wordpress directory
&&		mkdir -p /var/www/html/wordpress \
# Download the latest version of WordPress
&&		wp core download --path="/var/www/html/wordpress" --allow-root

# Configure WordPress with the database information passed as arguments
RUN		cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
# Replace the database name in the wp-config.php file
&&		sed -i "s/database_name_here/$MYSQL_DATABASE/" /var/www/html/wordpress/wp-config.php \
# Replace the database user in the wp-config.php file
&&		sed -i "s/username_here/$MYSQL_USER/" /var/www/html/wordpress/wp-config.php \
# Replace the database password in the wp-config.php file
&&		sed -i "s/password_here/$MYSQL_PASSWORD/" /var/www/html/wordpress/wp-config.php \
# Replace the database host in the wp-config.php file
&&		sed -i "s/localhost/$MYSQL_HOST/" /var/www/html/wordpress/wp-config.php

# Expose ports 9000 and 3306
EXPOSE	9000 3306

# Copy the entrypoint.sh script and use it as the ENTRYPOINT for the container
COPY	./tools/entrypoint.sh /tmp
ENTRYPOINT	["sh", "/tmp/entrypoint.sh"]