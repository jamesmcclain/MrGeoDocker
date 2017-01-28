A MrGeo Docker Image

- https://github.com/ngageoint/mrgeo/wiki/Installation
- https://github.com/ngageoint/mrgeo/wiki/MrGeo-Build-Instructions
- https://github.com/ngageoint/mrgeo/wiki/MrGeo-Build-Dependencies

-----

```bash
docker run -it --rm --hostname leader --name leader -p 8088:8088 --entrypoint /scripts/leader.sh jamesmcclain/mrgeo:239f4d4
```

```bash
root@leader:/# mrgeo showconf
Changed log level for: org.apache.hadoop.io.compress.CodecPool to: warn
Changed log level for: org.apache.hadoop.hdfs.DFSClient to: error
Changed log level for: org.apache.commons.httpclient.Wire to: warn
Changed log level for: org.apache.http.wire to: warn
Setting up Log4JLoggerAdapter default output format
LoggingUtils: Setting default (root) log level to: ERROR
Changed log level for: org.apache.hadoop.io.compress.CodecPool to: warn
Changed log level for: org.apache.hadoop.hdfs.DFSClient to: error
Changed log level for: org.apache.commons.httpclient.Wire to: warn
Changed log level for: org.apache.http.wire to: warn
19:23:07.545 (0) ERROR mrgeo.cmd.MrGeo: Exception thrown
java.lang.NullPointerException
        at java.util.Properties$LineReader.readLine(Properties.java:434)
        at java.util.Properties.load0(Properties.java:353)
        at java.util.Properties.load(Properties.java:341)
        at org.mrgeo.cmd.showconfiguration.ShowConfiguration.reportMrGeoSettingsProperties(ShowConfiguration.java:77)
        at org.mrgeo.cmd.showconfiguration.ShowConfiguration.buildReport(ShowConfiguration.java:277)
        at org.mrgeo.cmd.showconfiguration.ShowConfiguration.run(ShowConfiguration.java:317)
        at org.mrgeo.cmd.MrGeo.run(MrGeo.java:238)
        at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:70)
        at org.mrgeo.cmd.MrGeo.main(MrGeo.java:59)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:498)
        at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
        at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
```
