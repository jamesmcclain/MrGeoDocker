This image is intended for local development and testing.

Starting the container:
```bash
docker run -it --rm --hostname leader --name leader -p 8088:8088 -p 8080:8080 --entrypoint /scripts/leader.sh jamesmcclain/mrgeo:7ea5ffd
```

An example workflow:
```bash
$ su hdfs -c "bash"
$ export HADOOP_CLIENT_OPTS="-Xmx12g"
$ export PATH=$PATH:/opt/mrgeo/bin:/opt/hadoop-2.7.2/bin
$ mrgeo ingest -o friction file:///tmp/friction.tif # ingest friction layer
$ mrgeo mapalgebra -s /tmp/costdistance -b -o cost  # run map algebra script
$ mrgeo export -s -o /tmp/cost cost                 # produce a file called /tmp/cost.tif
```
