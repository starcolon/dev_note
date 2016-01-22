## Spark

Installing Spark on OSX is a convenient thing to do.

### Installation

- First of all, get Spark from [http://spark.apache.org/downloads.html](http://spark.apache.org/downloads.html). Preferrably, Pre-built for any specific Hadoop release.

- Copy the downloaded Spark to a preferred location and extract.

```
$ cp spark-1.6.0-bin-hadoop2.6.tgz /opt/
$ tar xvf /opt/spark-1.6.0-bin-hadoop2.6.tgz
```

- Get Java if you haven't got it installed.

- Install Scala

```
$ brew install scala
```

- Install py4j if you want to use Spark on Python.

```
$ pip3 install py4j
```

- Configure the environment variables. You may want to put these definitions in a startup bash script which you'd prefer.

```
export SPARK_HOME=/opt/spark-1.6.0-bin-hadoop2.6/
export PYSPARK_PYTHON=/Library/Frameworks/Python.framework/Versions/3.4/bin/python3
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
```

For the definitions of the variables, refer to the [Spark environment variable guide here](http://spark.apache.org/docs/latest/configuration.html#environment-variables)

