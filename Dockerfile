# Docker container for running mirror scripts

FROM debian:latest
MAINTAINER Ralph Giles <giles@xiph.org>

# Packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git

# Setup
# https://github.com/docker/docker/issues/6820
ADD clone.sh /mirror/
ADD update.sh /mirror/
ADD ORIGIN /mirror/
ADD REPOS /mirror/
Add REMOTE /mirror/
WORKDIR /mirror
RUN cd /mirror && ./clone.sh
