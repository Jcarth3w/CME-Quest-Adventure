FROM php:8.0-apache

# Install required PHP extensions
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev \
        libzip-dev \
    && docker-php-ext-install \
        pdo_mysql \
        zip

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Set XDEBUG_MODE to coverage
ENV XDEBUG_MODE=coverage

# Install unzip command
RUN apt-get update && apt-get install -y unzip

# Install 7z command
RUN apt-get install -y p7zip-full

# Enable Apache modules
RUN a2enmod rewrite headers

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHPUnit
RUN composer global require phpunit/phpunit

# Add Composer global bin directory to the PATH
ENV PATH="${PATH}:/root/.composer/vendor/bin"

# Restart Apache
RUN service apache2 restart

# Expose port 8000 (not necessary if you're using the default port 80)
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
