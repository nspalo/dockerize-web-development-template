# Scripts Directory
- This directory will host all scripts
- Make commands easy

## Directory Structure
- Below is an overview of how the project directory structure would look like.
- Add / Remove / Rename according to the needs or liking or whatever make sense.
```
my-project/                      // Main Project Directory
├── ...
├── scripts/                     // This should contains all *.sh files 
│   ├── main-docker-compose.sh   // Main script that executes the base docker command
│   ├── build.sh
│   ├── up.sh
│   ├── down.sh
│   ├── *.sh
│   └── ...
└── ...
```

### Service containers: Building, Starting, and Stopping
```
// Building the services/containers
> ./scripts/build.sh

// Starting the services/containers
// - optionally add the -d (detach) flag to run in the background
> ./scripts/up.sh -d

// Or do a one-liner command for the build and start process
> ./scripts/up.sh -d --build

// Stoping the services/containers
// - To stop a specific service add the continer name
> ./scripts/stop.sh <_ContainerName_>

// Tear down routine
// - optionally add the -v to remove the images 
> ./scripts/down.sh -v
```

### Packages and Dependencies
```
// Running NPM
> ./scripts/run.sh npm install
> ./scripts/run.sh npm run build

// Running Composer
> ./scripts/composer.sh install
> ./scripts/composer.sh dump-autoload
```

### Accessing the site
Hit the browser at `localhost:8080`
