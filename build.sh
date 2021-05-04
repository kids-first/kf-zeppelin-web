#!/bin/bash
set -e
git submodule update --init

docker run -it --rm --name my-maven-project -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.8.1-jdk-11 mvn package
aws s3 cp ./target/zeppelin-web-0.9.1-SNAPSHOT.war s3://kf-strides-variant-parquet-prd/ami_libraries/zeppelin/zeppelin-web-0.9.1-SNAPSHOT.war
