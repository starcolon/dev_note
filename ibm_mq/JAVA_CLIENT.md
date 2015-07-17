# Develop a Java client for MQM 7.5+

Java client requires additional rpm packages to be installed:

- MQSeriesJava-7.5.0-2.x86_64.rpm
- MQSeriesJRE-7.5.0-2.x86_64.rpm

Then make sure to source this as the configurations are patched:

```bash
	/opt/mqm/java/bin/setjmsenv
```

Also update the CLASS_PATH variable with these:

```bash
	export CLASSPATH=$CLASSPATH:/opt/mqm/java/lib/connector.jar:/opt/mqm/java/lib/com.ibm.mq.jmqi.jar:/opt/mqm/java/lib/com.ibm.mq.headers.jar

	export CLASSPATH=$CLASSPATH:/opt/mqm/java/lib/com.ibm.mq.commonservices.jar

	export CLASSPATH=$CLASSPATH:.
```

As well as LD_LIBRARY_PATH, with this:

```bash
	export LD_LIBRARY_PATH=/opt/mqm/lib/:/opt/mqm/lib64/
```


## Handy quick Java utilities

IBMMQ ships with some sample Java utilities for MQ connectivity test. Some can be found hereby as follows:

### Java client for connection over HTTP

Utilities for HTTP connection are located at:

```
/opt/mqm/java/http/samples
```

To test a request over HTTP POST, run this:

```bash
java -cp /opt/mqm/java/http/samples/ HTTPPOST
```

### Java client for connection over TCP (general approach)

Tools are located at:

```
/opt/mqm/samp/wmqjava/samples
```

To test a connection to an MQ server over TCP, run this following command. Note that the `setjmsenv` needs to be invoked beforehand or the class is not locatable in the system.

```bash
java MQIVP
```