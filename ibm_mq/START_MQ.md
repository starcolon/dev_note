# Prerequisites

### Refresh the configurations @mqm
Login as `mqm` and source bash profile:

You may add these to `~/.bash_profile` or the user `mqm`.

```bash
	/opt/mqm/bin/mqconfig

	. /opt/mqm/bin/setmqenv -s

	export MQSERVER=
```


```bash
	su mqm
	source ~/.bash_profile
```

# Create and start a queue manager

### Create a new queue manager

```bash
	crtmqm QMA
```

### Start and configure queue manager for local connectivity

```bash
	strmqm QMA
	runmqsc QMA
```

### Or start a TCP listener along with a queue manager for remote connectivity

```bash
	echo "start LISTENER(SYSTEM.DEFAULT.LISTENER.TCP)" | runmqsc QMA
```


# Handle queue manager via RUNMQSC console


### To create a new queue after have qeueue manager started:

Type this in the `runmqsc` console:

```
	DEFINE QLOCAL (QUEUE1)
```

### Start a channel (then a TCP listener needs to be started)

```
	START CHANNEL(SYSTEM.DEF.SVRCONN)
```

### Sample queue command cheatsheet

Queue pusher:

```bash
	/opt/mqm/samp/bin/amqsput {QUEUE NAME} {QUEUE MANAGER}
```

Queue listener:

```bash
	/opt/mqm/samp/bin/amqsget {QUEUE NAME} {QUEUE MANAGER}
```