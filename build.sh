#!/bin/bash
set -e
git submodule update --init

docker run --rm --name kf-zeppelin-web-build \
 --user $(id -u):$(id -g) \
 -v "$(pwd)":/usr/src/app \
 -w /usr/src/app \
 node:14 \
 npm run build:dist

docker run --rm --name kf-zeppelin-web-build \
 --user $(id -u):$(id -g) \
 -v "$(pwd)":/usr/src/mymaven \
 -v ~/.m2:/var/maven/.m2 \
 -e MAVEN_CONFIG=/var/maven/.m2 \
 -w /usr/src/mymaven \
 maven:3.8.1-jdk-11 \
 mvn -Duser.home=/var/maven package
aws s3 cp ./target/zeppelin-web-0.9.1-SNAPSHOT.war s3://kf-strides-variant-parquet-prd/ami_libraries/zeppelin/zeppelin-web-0.9.1-SNAPSHOT.war
