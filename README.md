# Dockerized Web Development Template
> A simple project that aims to build a Dockerized template environment for web development

![CI BUILD](https://github.com/nspalo/dockerize-web-development-template/actions/workflows/ci-build.yml/badge.svg)

## Quick Start

```bash
# 1. Clone and enter the project
git clone https://github.com/nspalo/dockerize-web-development-template.git my-project
cd my-project

# 2. Set up environment
cp docker/environments/dev.env.example docker/environments/dev.env
# Edit dev.env with your database credentials

# 3. Build and start
make build
make up

# 4. Visit the site
# http://localhost (or whatever APP_PORT is set to in config.env)
```

Run `make help` to see all available commands.

## Configuration

All settings are controlled from a single file: `docker/environments/config.env`

```env
SYS_ENV=dev           # Environment: dev | staging | prod
PHP_VERSION=8.3       # PHP version
DB_VERSION=8.0        # MySQL version
NODE_VERSION=20       # Node.js version
APP_PORT=80           # Web server port
```

## Commands

```bash
make build            # Build all Docker images
make up               # Start services (detached)
make up-build         # Build and start in one command
make down             # Stop and remove containers
make down-v           # Stop, remove containers and volumes
make stop             # Stop services (keep containers)
make restart          # Restart all services
make logs             # Follow logs from all containers
make ps               # List running containers
make shell            # Open a shell in the PHP container

# Package Managers
make composer cmd="install"        # Run Composer commands
make composer cmd="dump-autoload"
make npm cmd="install"             # Run NPM commands
make npm cmd="run build"
make artisan cmd="migrate"         # Run Artisan commands

# Maintenance
make prune            # Remove ALL Docker images (dangerous)
make clean            # Stop services, remove volumes, prune images
```

## Directory Structure

```
my-project/
├── docker/
│   ├── containers/                // Service Dockerfiles and configs
│   │   ├── nginx/
│   │   │   ├── conf.d/default.conf
│   │   │   └── Dockerfile
│   │   ├── php/
│   │   │   ├── config/
│   │   │   │   ├── php-dev.ini
│   │   │   │   ├── php-staging.ini
│   │   │   │   └── php-prod.ini
│   │   │   └── Dockerfile         // Multi-stage build
│   │   ├── mysql/
│   │   │   ├── conf.d/my.cnf
│   │   │   └── Dockerfile
│   │   └── composer/
│   │       └── Dockerfile
│   ├── environments/
│   │   ├── config.env             // Single control panel
│   │   ├── dev.env.example        // Credential templates
│   │   ├── staging.env.example
│   │   └── prod.env.example
│   ├── docker-compose.yml         // Base compose (shared)
│   ├── docker-compose.dev.yml     // Dev override (volumes, debug ports)
│   └── docker-compose.prod.yml    // Prod override (locked down)
├── scripts/                       // Shell scripts (legacy, use Makefile)
├── src/                           // Your application source code
│   └── public/
│       └── index.php
└── Makefile                       // Primary command interface
```

## Environments

| Environment | Compose Override | Behavior |
|-------------|----------------|----------|
| `dev` | `docker-compose.dev.yml` | Volume mounts, all ports exposed, debug-friendly |
| `staging` | `docker-compose.prod.yml` | Production-like, no debug ports |
| `prod` | `docker-compose.prod.yml` | Locked down, resource limits, health checks |

Change environment by editing `SYS_ENV` in `docker/environments/config.env`.

## Host file

Optionally, update your host file:
```
127.0.0.1 my-website.local
```

Then access via `http://my-website.local` instead of `localhost`.
