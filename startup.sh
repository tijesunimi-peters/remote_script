#!/bin/sh
#

docker run --privileged --name=main -p 2200:22 -d -v /var/run/docker.sock:/var/run/docker.sock remote
