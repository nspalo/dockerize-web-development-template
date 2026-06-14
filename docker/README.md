# Docker Directory
- This directory will host all docker related files.

## Directory Structure
- Below is an overview of how the project directory structure would look like.
- Add / Remove / Rename according to the needs or liking or whatever make sense.
```
my-project/                       // Main Project Directory
├── docker/                       // Docker Related
│   ├── containers/               // Service Containers
│   │   ├── nginx/
│   │   │   ├── conf.d/           // NginX Configurations
│   │   │   │   └── default.conf  // default configuration file
│   │   │   └── Dockerfile
│   │   ├── php/
│   │   │   ├── config/             // PHP Configurations
│   │   │   │   └── php-dev.ini     // development configuration
│   │   │   │   └── php-staging.ini // staging configuration
│   │   │   │   └── php-prod.ini    // production configuration
│   │   │   └── Dockerfile
│   │   ├── mysql/
│   │   │   ├── conf.d/            // MySql Configurations
│   │   │   │   └── my.cnf         // default configuration file
│   │   │   └── Dockerfile
│   │   └── composer/
│   │       └── Dockerfile
│   ├── environments/              // Environment variables
│   │   ├── config.env             // Main config file (single control panel)
│   │   ├── dev.env                // Development credentials
│   │   ├── staging.env            // Staging credentials
│   │   └── prod.env               // Production credentials
│   ├── docker-compose.yml         // Base Docker compose file
│   ├── docker-compose.dev.yml     // Development override
│   └── docker-compose.prod.yml    // Production override
└── ...
```
