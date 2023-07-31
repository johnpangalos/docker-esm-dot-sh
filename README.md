# Archival notice

This repos has been archived, please use the official repository found here:

https://github.com/esm-dev/esm.sh/pkgs/container/esm.sh

# Docker esm.sh

This is a docker container for the [esm.sh project](https://esm.sh/), with the
purpose of being used for self hosting. The reason this project is necessary is
that there is no official image for esm.sh.

## Basic usage

Run the following command to get up and running.

```sh
docker run -p 8080:8080 -p 8088:8088 ghcr.io/johnpangalos/esm-dot-sh
```

Then visit the [test website](http://localhost:8080/?test) to ensure everything
is running as intended.

## Adding a config

Use the following `Dockerfile` with a [esm.sh config](https://github.com/esm-dev/esm.sh/blob/main/config.example.jsonc)
in the same folder as the `Dockerfile`.

```dockerfile
FROM ghcr.io/johnpangalos/esm-dot-sh
ADD ./config.json /config/config.json
CMD ["/esmd", "--config", "/config/config.json"]
```

Then run the following to start you server:

```sh
docker build -t esm-server .
docker run -p 8080:8080 -p 8088:8088 esm-server
```

## How is this updated?

This repo is updated daily automatically and currently creates two builds. One
for the current state of the `main` branch called edge, and another for any new
tags committed to esm.sh under the tag name and latest.

## What's being used for a base image?

The base image is Alpine, feel free to make an issue if you'd like another base
image.
