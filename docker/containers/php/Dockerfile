#=====================================================================
# PHP Dockerfile
#---------------------------------------------------------------------
# docker/containers/php/Dockerfile
#=====================================================================

# Install PHP
FROM php:8.2-fpm-alpine

# 1. Define the build argument for the environment
ARG SYS_ENV

# Set the working directory to the standard web root
WORKDIR /var/www/html

# Install common system dependencies and PHP extensions in a single layer
# 1. Install system packages (git, zip dependencies)
# 2. Configure and install required PHP extensions (opcache for speed)
RUN apk add --no-cache git zip libzip-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo pdo_mysql opcache zip \
    && rm -rf /var/cache/apk/* # Clean up cache to minimize image size

# Copy PHP configuration
# This uses the build arg to select the correct INI file (e.g., php-development.ini)
# and places it in the conf.d directory as 99-custom.ini to ensure it overrides defaults.
COPY ./containers/php/config/php-${SYS_ENV}.ini /usr/local/etc/php/conf.d/99-custom.ini

# Default command to start PHP-FPM
CMD ["php-fpm"]