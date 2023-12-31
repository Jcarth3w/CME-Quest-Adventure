FROM php:7.3-apache
WORKDIR /var/www/html
RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql
RUN apt-get update && apt-get -y install sudo
RUN sudo a2enmod rewrite &&  \
    sudo a2enmod headers  &&  \
    sudo service apache2 restart
EXPOSE 8000
# FROM ubuntu:latest
# WORKDIR /usr/src/app

# # Variables
# ENV GODOT_VERSION "4.1.1"
# ENV GODOT_GAME_NAME "CME Quest Adventures"
# ENV HTTPS_GIT_REPO "https://github.com/Jcarth3w/CME-Quest-Adventure.git"

# # Install necessary dependencies
# RUN apt-get update && apt-get install -y \
#     wget \
#     unzip

# # Download and install Godot 4.1.1
# RUN wget https://github.com/godotengine/godot-builds/releases/download/4.1.1-stable/Godot_v4.1.1-stable_linux.x86_64.zip \
#     && unzip Godot_v4.1.1-stable_linux.x86_64.zip \
#     && rm Godot_v4.1.1-stable_linux.x86_64.zip

# # Set the entry point to run Godot
# ENTRYPOINT ["./Godot_v4.1.1-stable_linux.x86_64"]
