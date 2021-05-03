#!/bin/bash

git submodule update --init
mvn package

aws s3 cp ./target/zeppelin-web-0.9.1-SNAPSHOT.war s3://kf-strides-variant-parquet-prd/ami_libraries/zeppelin/zeppelin-web-0.9.1-SNAPSHOT.war
