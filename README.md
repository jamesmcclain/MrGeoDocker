This image is intended for local development and testing.

```bash
docker run -it --rm --hostname leader --name leader -p 8088:8088 -p 8080:8080 --entrypoint /scripts/leader.sh jamesmcclain/mrgeo:0c6ed4a
```

```bash
$ su hdfs -c "bash"
$ export PATH=$PATH:/opt/mrgeo/bin:/opt/hadoop-2.7.2/bin
$ mrgeo ingest -o friction file:///tmp/road_fric.tif
```
