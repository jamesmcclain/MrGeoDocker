#!/usr/bin/env bash

echo "$(find /root/.m2 | grep jar$ | wc -l) jars found"

cd /mrgeo

./scripts/mvn-build clean > /dev/null
./scripts/mvn-build all apache272 build -y -jv 1.8 -Dpomtools-maven.version=0.2.0 > /dev/null

chown -R $1:$2 /root/.m2
chown -R $1:$2 /mrgeo
