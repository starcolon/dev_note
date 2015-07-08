# Start a new queue manager

### Refresh the configurations @mqm
Login as `mqm` and source bash profile:

You may add these to `~/.bash_profile` or the user `mqm`.

```bash
	/opt/mqm/bin/mqconfig

	. /opt/mqm/bin/setmqenv -s

	export MQSAMPLE=/opt/mqm/samp/bin/
```


```bash
	su mqm
	source ~/.bash_profile
```

### Create a new queue manager

```bash
	crtmqm QMA
```

### Start and configure queue manager

```bash
	strmqm QMA
	runmqsc QMA
```


### To create a new queue after have qeueue manager started:

Type this in the `runmqsc` console:

```
	DEFINE QLOCAL (QUEUE1)
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