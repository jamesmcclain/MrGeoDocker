MRGEO_VERSION := 1.2.0-SNAPSHOT
MRGEO_SHA := 239f4d401f873c88c1082f734ffabdcdffe2330f
SHA := $(shell echo ${MRGEO_SHA} | sed 's,\(.......\).*,\1,')

DIST_ARCHIVE := archives/${MRGEO_SHA}.zip


all: mrgeo-${MRGEO_SHA}/distribution/distribution-tgz/target/mrgeo-${MRGEO_VERSION}.tar.gz

.PHONY stage0:
	docker build -f Dockerfile.mrgeo-build -t jamesmcclain/mrgeo:stage0 .

${DIST_ARCHIVE}:
	(cd archives ; curl -L -C - -O "https://github.com/ngageoint/mrgeo/archive/${MRGEO_SHA}.zip")

mrgeo-${MRGEO_SHA}/: ${DIST_ARCHIVE}
	unzip -u $<

mrgeo-${MRGEO_SHA}/distribution/distribution-tgz/target/mrgeo-${MRGEO_VERSION}.tar.gz: mrgeo-${MRGEO_SHA}/
	docker run -it --rm \
	--volume $(PWD)/mrgeo-${MRGEO_SHA}:/mrgeo:rw \
	--volume $(HOME)/.m2:/root/.m2:rw \
	--volume $(PWD)/scripts:/scripts:ro \
	jamesmcclain/mrgeo:stage0 /scripts/build.sh $(shell id -u) $(shell id -g)
