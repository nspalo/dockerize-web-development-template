#!/usr/bin/env bash

set -eo pipefail

# Load SYS_ENV from config to determine which compose override to use
SYS_ENV=$(grep -E '^SYS_ENV=' docker/environments/config.env | cut -d '=' -f2)

# Map SYS_ENV to the appropriate compose override file
# dev          → docker-compose.dev.yml  (volume mounts, debug ports)
# staging/prod → docker-compose.prod.yml (locked down, resource limits)
if [ "$SYS_ENV" = "dev" ]; then
  COMPOSE_OVERRIDE="dev"
else
  COMPOSE_OVERRIDE="prod"
fi

docker compose \
  --env-file "docker/environments/config.env" \
  -f "docker/docker-compose.yml" \
  -f "docker/docker-compose.${COMPOSE_OVERRIDE}.yml" \
  ${@}
