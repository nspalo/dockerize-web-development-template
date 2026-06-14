#=====================================================================
# PHP Dockerfile (Multi-Stage Build)
#---------------------------------------------------------------------
# docker/containers/php/Dockerfile
#
# Stages:
#   1. builder  — Compiles extensions, installs tools (Composer)
#   2. runtime  — Minimal production-ready image
#=====================================================================

# =====================================================================
# Stage 1: Builder
# ---------------------------------------------------------------------
# This stage installs system dependencies, compiles PHP extensions,
# and prepares tools. It is NOT included in the final image.
# =====================================================================
ARG PHP_VERSION=8.4
FROM php:${PHP_VERSION}-fpm-alpine AS builder

WORKDIR /var/www/html

# Install system dependencies required to COMPILE PHP extensions
# These packages are only needed at build time, not at runtime
RUN apk add --no-cache \
    git \
    zip \
    unzip \
    libzip-dev \
    icu-dev \
    oniguruma-dev \
    linux-headers

# Install and configure PHP extensions
# --- Base extensions (most PHP projects need these) ---
RUN docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) \
        pdo \
        pdo_mysql \
        opcache \
        zip \
        intl \
        mbstring

# --- Project-specific extensions (uncomment as needed) ---
# RUN apk add --no-cache freetype-dev libjpeg-turbo-dev libpng-dev \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) gd exif
# RUN pecl install redis && docker-php-ext-enable redis
# RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install Composer binary from the official Composer image
COPY --from=composer:2.7 /usr/bin/composer /usr/local/bin/composer

# =====================================================================
# Stage 2: Runtime
# ---------------------------------------------------------------------
# This is the final, minimal image that runs in development and
# production. It contains only what's needed to EXECUTE PHP code.
# =====================================================================
FROM php:${PHP_VERSION}-fpm-alpine AS runtime

ARG SYS_ENV=dev

WORKDIR /var/www/html

# Install ONLY runtime libraries (shared libs that extensions link against)
# No -dev packages, no compilers, no build tools
RUN apk add --no-cache \
    libzip \
    icu-libs \
    oniguruma

# Copy compiled PHP extensions from the builder stage
COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/

# Copy extension configuration (.ini files that enable the extensions)
COPY --from=builder /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/

# Copy Composer binary (useful for running composer commands in the container)
COPY --from=builder /usr/local/bin/composer /usr/local/bin/composer

# Copy environment-specific PHP configuration
# This overrides defaults with your custom settings (errors, uploads, security)
COPY ./containers/php/config/php-${SYS_ENV}.ini /usr/local/etc/php/conf.d/99-custom.ini

# Create a non-root user for running PHP-FPM (security best practice)
RUN addgroup -g 1000 appuser \
    && adduser -u 1000 -G appuser -s /bin/sh -D appuser \
    && chown -R appuser:appuser /var/www/html

# Switch to non-root user
USER appuser

# Expose PHP-FPM port
EXPOSE 9000

# Health check — verifies PHP-FPM config is valid
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD php-fpm -t || exit 1

CMD ["php-fpm"]
