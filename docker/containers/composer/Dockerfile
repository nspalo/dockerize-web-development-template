# =====================================================================
# Composer Dockerfile
# ---------------------------------------------------------------------
# docker/containers/composer/Dockerfile
# =====================================================================

# Create composer image from the 'base' image alias defined in the docker-compose.yml
# 'additional_contexts' to point to the result of the PHP service build.
FROM base as composer_base

# Install Composer
# This curl command fetches the installer and pipes it to PHP, installing the
# Composer executable (named 'composer') directly into /usr/local/bin.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.1

# Since the executable is in /usr/local/bin, it is automatically available in the container's PATH.
# Add composer bin path to environment variable
RUN export PATH=$PATH":/usr/bin"

# Set working directory
WORKDIR /var/www/html
