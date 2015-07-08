# For python 2.6:

Download and install python mqm interface module from source.

## Prerequisites

Download and install python development package for python 2.6.
The version definitely matters and cannot be used across versions of python.

Download python development package from: [http://rpmfind.net/linux/rpm2html/search.php?query=python-devel]

```bash
	wget ftp://rpmfind.net/linux/centos/6.6/os/x86_64/Packages/python-devel-2.6.6-52.el6.x86_64.rpm
```

Install via rpm

```bash
	rpm -ivh python-devel-2.6.6-52.el6.x86_64.rpm
```

Download pymqi package

```bash
	wget https://pypi.python.org/packages/source/p/pymqi/pymqi-1.4.tar.gz
	tar -zxvf pymqi-1.4.tar.gz
```

Install pymqi from source with python 2.6

```bash
	cd pymqi-1.4
	python2.6 setup.py build client
	python2.6 setup.py install
```