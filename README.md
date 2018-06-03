# rmtp-server

A simple nginx RMTP server in a Docker container

## Requirements

Docker needs to be installed on your computer. [Docker installation](https://docs.docker.com/install/) can be found in their documentation.

## Usage

Build the Docker image locally and run it.

```
# clone this repository
$ git clone https://github.com/FenrirUnbound/rtmp-server

# change into the repository's directory
$ cd rtmp-server

# build the image locally
$ make local-build

# use the docker image you just built
$ make local-run
```
