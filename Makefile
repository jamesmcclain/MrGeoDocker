.PHONY: stage0 stage1 mrgeo

MRGEO_VERSION := 1.2.0-SNAPSHOT
MRGEO_SHA := 0c6ed4a7e66bb0923ec5c570b102862aee9e885e
SHA := $(shell echo ${MRGEO_SHA} | sed 's,\(.......\).*,\1,')
DIST_ARCHIVE := archives/${MRGEO_SHA}.zip
GDAL_VERSION := 1.10.1

all: mrgeo

stage0:
	docker build -f Dockerfile.stage0 -t jamesmcclain/mrgeo:stage0 .

stage1:
	docker build -f Dockerfile.stage1 -t jamesmcclain/mrgeo:stage1 .

archives/${MRGEO_SHA}.zip:
	(cd archives ; curl -L -C - -O "https://github.com/ngageoint/mrgeo/archive/${MRGEO_SHA}.zip")

mrgeo-${MRGEO_SHA}/: archives/${MRGEO_SHA}.zip
	unzip -u $<

mrgeo-${MRGEO_SHA}/distribution/distribution-tgz/target/mrgeo-${MRGEO_VERSION}.tar.gz: mrgeo-${MRGEO_SHA}/
	docker run -it --rm \
	--env GDAL_VERSION=${GDAL_VERSION} \
	--volume $(PWD)/mrgeo-${MRGEO_SHA}:/mrgeo:rw \
	--volume $(HOME)/.m2:/root/.m2:rw \
	--volume $(PWD)/scripts:/scripts:ro \
	jamesmcclain/mrgeo:stage1 /scripts/build.sh $(shell id -u) $(shell id -g)

mrgeo.tar.gz: mrgeo-${MRGEO_SHA}/distribution/distribution-tgz/target/mrgeo-${MRGEO_VERSION}.tar.gz
	cp -f $< $@

javax.servlet-api-3.1.0.jar:
	cp -f $(HOME)/.m2/repository/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar $@

mrgeo: mrgeo.tar.gz javax.servlet-api-3.1.0.jar
	docker build -f Dockerfile.mrgeo -t  jamesmcclain/mrgeo:${SHA} .
