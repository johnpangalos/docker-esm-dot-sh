# Docker esm.sh

This is a docker container for the [esm.sh project](https://esm.sh/), with the
purpose of being used for self hosting. The reason this project is necessary is
that there is no official image for esm.sh.

## Basic usage

Run the following command to get up and running.

```sh
docker run -p 8080:8080 ghcr.io/johnpangalos/esm-dot-sh
```

Then visit the [test website](http://localhost:8080/?test) to ensure everything
is running as intended.

## Adding a config

```dockerfile
FROM ghcr.io/johnpangalos/esm-dot-sh
ADD ./config.json /config/config.json
CMD ["/esmd", "--config", "/config/config.json"]
```

## How is this updated?

This repo is updated daily automatically and currently creates two builds. One
for the current state of the `main` branch called edge, and another for any new
tags committed to esm.sh under the tag name and latest.

## What's being used for a base image?

The base image is Alpine, feel free to make an issue if you'd like another base
image.
