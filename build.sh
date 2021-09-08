#!/bin/bash
set -e
git submodule update --init

mkdir -p ~/.m2

docker run --rm --name kf-zeppelin-web-build \
 --user $(id -u):$(id -g) \
 -v "$(pwd)":/usr/src/app \
 -w /usr/src/app \
 node:14 \
 yarn install && npm run build:dist

docker run --rm --name kf-zeppelin-web-build \
 --user $(id -u):$(id -g) \
 -v "$(pwd)":/usr/src/mymaven \
 -w /usr/src/mymaven \
 maven:3.8.1-jdk-11 \
 mvn package

aws s3 cp ./target/zeppelin-web-0.10.1-SNAPSHOT.war s3://kf-strides-variant-parquet-prd/ami_libraries/zeppelin/zeppelin-web-0.10.1-SNAPSHOT.war
