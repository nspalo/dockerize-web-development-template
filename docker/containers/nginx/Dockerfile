#=====================================================================
# NginX Dockerfile
#---------------------------------------------------------------------
# docker/containers/nginx/Dockerfile
#=====================================================================

# Install NginX
FROM nginx:stable-alpine

# Set the working directory
WORKDIR /var/www/html

# Copy NginX configuration
# This is crucial for making the built image self-contained and ready for production,
# even though the volume mount in docker-compose.yml will override it for local development.
COPY ./containers/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
