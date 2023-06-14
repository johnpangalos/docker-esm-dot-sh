#######################################
#
# Build
#
#######################################
FROM golang:1.19-alpine AS build-stage

ENV ESM_SH_VERSION 125
ENV ESM_SH_GIT_URL https://github.com/esm-dev/esm.sh

RUN apk add --no-cache git

RUN git clone --depth 1 --branch v$ESM_SH_VERSION $ESM_SH_GIT_URL /esm/esm.sh
WORKDIR /esm/esm.sh
RUN CGO_ENABLED=0 GOOS=linux go build -o /esm/bin/esmd main.go

#######################################
#
# Release
#
#######################################
FROM node:18-alpine AS release-stage

RUN mkdir -p /esm && chown node:node /esm
RUN npm i -g pnpm
USER node
WORKDIR /
COPY --from=build-stage /esm/bin/esmd /esmd

EXPOSE 8080
CMD ["/esmd"]
