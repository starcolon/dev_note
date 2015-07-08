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

### Create a new MQ

```bash
	crtmqm QMA
```

### Start and configure MQ

```bash
	strmqm QMA
	runmqsc QMA
```


### To create a new queue after have qeueue manager started:

Type this in the `runmqsc` console:

```
	DEFINE QLOCAL (QUEUE1)
```