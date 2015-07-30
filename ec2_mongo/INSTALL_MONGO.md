#Prepare MongoDB on AWS EC2
==========================

Complete and comprehensive installation guide can be found at <a href="http://docs.mongodb.org/ecosystem/platforms/amazon-ec2/">Official MongoDB installation guide for AWS</a>. Follow the instructions thoroughly until it finishes.

##Allow remote connectivity to mongodb
There are a few steps to do so:

###1) Configure the instance's security group
Logon to the EC2 instance control panel on `aws.amazon.com` and go to the control panel of the EC2 instance where we want to configure.

<b>Under Network & Security > Security Groups</b>
Add inbound and outbound rules for mongo port 27017 (or also 28017 for web UI) to the active security group which our EC2 is utilizing.

###2) Configure the mongo environment
Logon to EC2 via `eb ssh`. 

```bash
	$ sudo vi /etc/mongod.conf
```

Then comment or remove this line below so mongo accepts remote inbound traffic:

```
	bind_ip=127.0.0.1
```

Reboot the service to take effects

```bash
	$ sudo service mongod restart
```