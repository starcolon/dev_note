# Shell tips
===================

## Show processes in trees of parents and child processes

```
ps axjf
```


## List all symlink original paths

```
ls -lrf
```

## View all mounted paths (human readable)

```
df -aTh
```

# netstat

All you need to know about netstat https://www.petri.com/netstat-command-monitor-network-traffic


# IO

Truncate file to zero length

```
:> file
```

- Redirect stdout `1 > file`
- Redirect stderr `2 > file`
- Redirect both `& > file`
- Redirect stderr to stdout `2 > &1`

