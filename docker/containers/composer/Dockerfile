# CRITICAL FIX:
# The FROM instruction now uses the alias 'base'.
# This alias is defined in docker-compose.yml's 'additional_contexts'
# and explicitly tells Docker to use the result of the 'php' service build
# as the base image, fixing the build order dependency.
FROM base

# Install Composer
# This curl command fetches the installer and pipes it to PHP, installing the
# Composer executable (named 'composer') directly into /usr/local/bin.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.1

# Since the executable is in /usr/local/bin, it is automatically available in the container's PATH.
# Add composer bin path to environment variable
RUN export PATH=$PATH":/usr/bin"
