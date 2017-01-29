#!/usr/bin/env bash

echo "$(find /root/.m2 | grep jar$ | wc -l) jars found"

mvn install:install-file  -Dfile=/usr/share/java/gdal.jar -DgroupId=org.gdal -DartifactId=gdal -Dversion=${GDAL_VERSION} -Dpackaging=jar -DlocalRepositoryPath=/root/.m2 > /dev/null
cd /mrgeo
./scripts/mvn-build clean > /dev/null
./scripts/mvn-build all apache272 build -y -jv 1.8 -Dgdal.version=${GDAL_VERSION} -Dpomtools-maven.version=0.2.0 > /dev/null

chown -R $1:$2 /root/.m2
chown -R $1:$2 /mrgeo
