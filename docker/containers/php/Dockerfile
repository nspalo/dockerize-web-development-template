# Start from the official base image
FROM php:8.2-fpm-alpine

# Set the working directory to the standard web root
WORKDIR /var/www/html

# Install common system dependencies and PHP extensions in a single layer
# 1. Install system packages (git, zip dependencies)
# 2. Configure and install required PHP extensions (opcache for speed)
RUN apk add --no-cache git zip libzip-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install mysqli pdo pdo_mysql opcache zip \
    && rm -rf /var/cache/apk/* # Clean up cache to minimize image size

# Copy PHP configuration
# COPY ./containers/php/config/php-$SYS_ENV.ini /usr/local/etc/php/php.ini

# Default command to start PHP-FPM
CMD ["php-fpm"]