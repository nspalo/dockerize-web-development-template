# Dockerized Web Development Template
A simple project that aims to build a Dockerized environment repository for web development

## Directory Structure
- Below is an overview of how the project directory structure would look like.
- Add / Remove / Rename according to the needs or liking or whatever make sense.
```
my-project/                       // Main Project Directory
├── docker/                       // Docker Related
│   ├── containers/               // Service Containers
│   │   ├── nginx
│   │   │   ├── conf.d
│   │   │   │   └── default.conf  // nginx config
│   │   │   └── Dockerfile
│   │   ├── php
│   │   │   ├── php.ini           // PHP config
│   │   │   └── Dockerfile
│   │   ├── mysql
│   │   │   └── Dockerfile
│   │   └── composer
│   │       └── Dockerfile
│   ├── enviroments/              // Environment variables
│   │   ├── config.env            // Main config file
│   │   ├── local.env             // Environment config file
│   │   ├── test.env
│   │   └── prod.env
│   ├── volumes/                  // Volumes Dir - Data persistence
│   │   └── mysql                 // Database
│   │       └── mysql_<version>   // Specific database version
│   ├── docker-compose.yml        // Main Docker compose file
│   └── Dockerfile                // Main Dockerfile
├── scripts/                      // This should contains all *.sh files 
│   ├── main-docker-compose.sh    // Main script that executes the base docker command
│   ├── build.sh
│   ├── up.sh
│   ├── down.sh
│   └── *.sh
├── src/                          // Project source code here...
│   └── public/                   // temporary directory just for initial set up
│       └── index.php             // default file just to make sure things work, shows phpinfo
├──========================================================================
│       Or to separete the source code for frontend and backend,
│       instead of src/ you could also use the structure below
├──========================================================================
├── frontend(-src)/               // Front-end source code only
└── backend(-src)/                // Back-end source code only
```
