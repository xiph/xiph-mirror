# Docker container for running mirror scripts

FROM debian:latest
MAINTAINER Ralph Giles <giles@xiph.org>

# Packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git

# Setup
RUN adduser --home /mirror --disabled-password -gecos 'mirror scripts' mirror
# https://github.com/docker/docker/issues/6820
ADD clone.sh /mirror/
ADD update.sh /mirror/
ADD daemon.sh /mirror/
ADD ORIGIN /mirror/
ADD REPOS /mirror/
Add REMOTE /mirror/
USER mirror
RUN cd /mirror && ./clone.sh

# Initialize known_hosts
RUN ssh -o 'StrictHostKeyChecking no' -N github.com || true

ENTRYPOINT /bin/sh -c "cd /mirror && ./daemon.sh"
