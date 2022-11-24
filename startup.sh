#!/bin/sh
#

docker run --privileged --name=main -p 2200:22 -p 3000:3000 -p 3050:3050 -p 5000:5000 -p 5001:5001 -p 5555:5555 -p 6379:6379 -p 8081:8081 -p 27017:27017 -d remote
