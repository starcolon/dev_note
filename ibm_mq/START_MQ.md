# Refresh the configurations @mqm
Login as `mqm` and source bash profile:

```bash
	su mqm
	source ~/.bash_profile
```

# Create a new MQ

```bash
	crtmqm QMA
```

# Start and configure MQ

```bash
	strmqm QMA
	runmqsc QMA
```


# To create a new queue after have qeueue manager started:

Type this in the `runmqsc` console:

```
	DEFINE QLOCAL (QUEUE1)
```