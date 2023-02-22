# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alexandervalencia <alexandervalencia@st    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/13 11:24:28 by alexanderva       #+#    #+#              #
#    Updated: 2023/02/13 17:00:11 by alexanderva      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if ! wp core verify-checksums 
then
    wp core install --allow-root \
    --urs=$DOMAIN_NAME \
    --title=$WP_SITE_TITLE \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL
fi

# launch php-fpm as a daemon in the foregroud this will listening for CGI
# requests 
php-fpm7.4
