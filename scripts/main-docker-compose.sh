#!/usr/bin/env bash

set -eo pipefail

# Load SYS_ENV from config to determine which compose override to use
SYS_ENV=$(grep -E '^SYS_ENV=' docker/environments/config.env | cut -d '=' -f2)

# Map SYS_ENV to the appropriate compose override file
# local/test environments use dev override (volume mounts, debug ports)
# prod uses prod override (locked down, resource limits)
if [ "$SYS_ENV" = "prod" ]; then
  COMPOSE_OVERRIDE="prod"
else
  COMPOSE_OVERRIDE="dev"
fi

docker compose \
  --env-file "docker/environments/config.env" \
  -f "docker/docker-compose.yml" \
  -f "docker/docker-compose.${COMPOSE_OVERRIDE}.yml" \
  ${@}
