IBM MQ Cookbook
===============
Install IBM MQ server.

Requirements
------------
CentOS6.

- Installation Name for MQ
  - Default is Installation1 (crtmqinst can change it for 2nd installation)
- Installation path
  - /opt/mqm 

System Configuration
--------------------
Syste Default
```
[root@yamamoto-vm-linux ~]# cat /proc/sys/kernel/shmmni
4096
[root@yamamoto-vm-linux ~]# cat /proc/sys/kernel/shmall
4294967296
[root@yamamoto-vm-linux ~]# cat /proc/sys/kernel/shmmax
68719476736
[root@yamamoto-vm-linux ~]# cat /proc/sys/kernel/sem
250	32000	32	128
[root@yamamoto-vm-linux ~]# cat /proc/sys/fs/file-max
98844
[root@yamamoto-vm-linux ~]# ulimit -n
1024
```

Minimum Spec of kernel parameters
```
/etc/sysctl.conf
kernel.shmmni = 4096
kernel.shmall = 2097152
kernel.shmmax = 268435456
kernel.sem = 500 256000 250 1024
fs.file-max = 524288
```

Minimum Spec of max number of files
```
/etc/security/limits.conf
mqm              hard    nofile          10240
mqm              soft    nofile          10240
```

Necessary Configuration
```
/etc/sysctl.conf
kernel.sem = 500 256000 250 1024
fs.file-max = 524288

/etc/security/limits.conf
mqm              hard    nofile          10240
mqm              soft    nofile          10240
mqm              hard    nproc            4096
mqm              soft    nproc            4096
```

Load the configuration
```bash
sysctl -p
```

### Reference
http://www-01.ibm.com/support/knowledgecenter/SSFKSJ_7.5.0/com.ibm.mq.ins.doc/q008550_.htm
http://www-01.ibm.com/support/docview.wss?uid=swg21271236

Installation
------------
```bash
$ yum install rpmbuild bc
$ mkdir mq
$ tar xvf MQ_7.5.0.2_TRIAL_LNX_ON_X86_64_ML.tar.gz -C mq
$ cd mq
$ ./mqlicense.sh -accept
$ rpm -ivh MQSeriesRuntime-*.rpm MQSeriesServer-*.rpm
```

For test
```bash
$ rpm -ivh MQSeriesSamples-7.5.0-2.x86_64.rpm
```

Check
```bash
$ su mqm -c "/opt/mqm/bin/mqconfig"
mqconfig: Analyzing CentOS release 6.6 (Final) settings for WebSphere MQ V7.5

System V Semaphores
  semmsl     (sem:1)  500 semaphores                     IBM>=500          PASS
  semmns     (sem:2)  1 of 256000 semaphores     (0%)    IBM>=256000       PASS
  semopm     (sem:3)  250 operations                     IBM>=250          PASS
  semmni     (sem:4)  1 of 1024 sets             (0%)    IBM>=1024         PASS

System V Shared Memory
  shmmax              68719476736 bytes                  IBM>=268435456    PASS
  shmmni              1 of 4096 sets             (0%)    IBM>=4096         PASS
  shmall              3 of 4294967296 pages      (0%)    IBM>=2097152      PASS

System Settings
  file-max            480 of 524288 files        (0%)    IBM>=524288       PASS
  tcp_keepalive_time  300 seconds                        IBM<=300          PASS

Current User Limits (mqm)
  nofile       (-Hn)  10240 files                        IBM>=10240        PASS
  nofile       (-Sn)  10240 files                        IBM>=10240        PASS
  nproc        (-Hu)  9 of 4096 processes        (0%)    IBM>=4096         PASS
  nproc        (-Su)  9 of 4096 processes        (0%)    IBM>=4096         PASS
```

Test
```bash
$ . /opt/mqm/bin/setmqenv -s
[root@yamamoto-vm-linux ~]# dspmqver
Name:        WebSphere MQ
Version:     7.5.0.2
Level:       p750-002-130704.TRIAL
BuildType:   IKAP - (Production)
Platform:    WebSphere MQ for Linux (x86-64 platform)
Mode:        64-bit
O/S:         Linux 2.6.32-504.el6.x86_64
InstName:    Installation1
InstDesc:    
Primary:     No
InstPath:    /opt/mqm
DataPath:    /var/mqm
MaxCmdLevel: 750
[root@yamamoto-vm-linux ~]# su mqm
bash-4.1$ crtman QMA
bash: crtman: command not found
bash-4.1$ crtmqm QMA
There are 90 days left in the trial period for this copy of WebSphere MQ.
WebSphere MQ queue manager created.
Directory '/var/mqm/qmgrs/QMA' created.
The queue manager is associated with installation 'Installation1'.
Creating or replacing default objects for queue manager 'QMA'.
Default objects statistics : 74 created. 0 replaced. 0 failed.
Completing setup.
Setup completed.
bash-4.1$ strmqm QMA
There are 90 days left in the trial period for this copy of WebSphere MQ.
WebSphere MQ queue manager 'QMA' starting.
The queue manager is associated with installation 'Installation1'.
5 log records accessed on queue manager 'QMA' during the log replay phase.
Log replay for queue manager 'QMA' complete.
Transaction manager state recovered for queue manager 'QMA'.
WebSphere MQ queue manager 'QMA' started using V7.5.0.2.
bash-4.1$ runmqsc QMA
5724-H72 (C) Copyright IBM Corp. 1994, 2011.  ALL RIGHTS RESERVED.
Starting MQSC for queue manager QMA.


DEFINE QLOCAL (QUEUE1)
     1 : DEFINE QLOCAL (QUEUE1)
AMQ8006: WebSphere MQ queue created.
end
     2 : end
One MQSC command read.
No commands have a syntax error.
All valid MQSC commands were processed.
```

Test with sample programs
```bash
bash-4.1$ /opt/mqm/samp/bin/amqsput QUEUE1 QMA
Sample AMQSPUT0 start
target queue is QUEUE1
alksdjflakdjf

Sample AMQSPUT0 end
bash-4.1$ ./amqsget QUEUE1 QMA
bash: ./amqsget: Permission denied
bash-4.1$ /opt/mqm/samp/bin/amqsget QUEUE1 QMA
Sample AMQSGET0 start
message <alksdjflakdjf>

no more messages
Sample AMQSGET0 end
```

### Reference
http://www-01.ibm.com/support/knowledgecenter/SSFKSJ_7.5.0/com.ibm.mq.ins.doc/q009240_.htm


Install Client
--------------
Runtime and Client
```bash
$ rpm -ivh MQSeriesClient-7.5.0-2.x86_64.rpm
```

Attributes
----------
e.g.
#### ibm_mq::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ibm_mq']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### imb_mq::default
e.g.
Just include `imb_mq` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[imb_mq]"
  ]
}
```
